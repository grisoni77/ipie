<?php

// No direct access to this file
defined('_JEXEC') or die('Restricted access');

/**
 * Facility Model
 */
class IPieModelDraft extends IPieModelAdmin
{
    public function __construct($config = array())
    {
        parent::__construct($config);
        
        $this->event_after_delete = 'onAfterDraftDelete';
        $dispatcher = JDispatcher::getInstance();
        $dispatcher->register($this->event_after_delete, 'IPiePluginDraft');
    }

    /**
     * Method to get the data that should be injected in the form.
     *
     * @return      mixed   The data for the form.
     * @since       2.5
     */
    protected function loadFormData()
    {
        // Check the session for previously entered form data.
        $data = JFactory::getApplication()->getUserState(CNL . '.edit.' . $this->_singular . '.data', array());
        if (empty($data))
        {
            $data = $this->getItem();
            $data->sectors = $this->getSubSectorsIds($data->draft_id);
            $data->current_logo = $data->logo;
        }
        return $data;
    }
    
    
//    public function prepareTable(&$table)
//    {
//        parent::prepareTable($table);
//        $address = sprintf('%s %s %s', $table->address, $table->city, $table->province, 'Italy');
//        $loc = IPieHelper::getLocation($address);
//        $table->lat = $loc['lat'];
//        $table->lng = $loc['lng'];
//        
//    }
    
    public function save($data)
    {
        // ricava logo
        if (empty($data['logo'])) {
            $data['logo'] = $this->copyLogo($data);
        } else {
            $this->deleteOldLogo($data['draft_id']);
        }
        // save
        $res = parent::save($data);
        // se ok salva anche dati accessori
        if ($res)
        {
            // get company_id
            $id = $this->getState($this->getName() . '.id');
            $this->saveSectors($id, $data['sectors']);
        }
        return $res;
    }
    
    public function approve($draft_id)
    {
        // set draft state to approved
        $item = $this->getItem($draft_id);
        $item->state = 'editable';
        //$item->store();
        parent::save($item->getProperties());
        // load data to be store in company record
        $data = $item->getProperties();
        $data['sectors'] = $this->getSubSectorsIds($draft_id);
        // copia immagine da draft
        if (!file_exists($this->getLogoPath().$data['logo'])) {
            JFile::copy($this->getLogoDraftPath().$data['logo'], $this->getLogoPath().$data['logo']);
            JFile::copy($this->getLogoDraftThumbPath().$data['logo'], $this->getLogoThumbPath().$data['logo']);
        }
        // get company model
        $model = JModel::getInstance('Company', 'IPieModel');
        return $model->save($data, false);
    }
    
    public function reject($draft_id)
    {
        // set draft state to approved
        $item = $this->getItem($draft_id);
        $item->state = 'editable';
        //$item->store();
        return parent::save($item->getProperties());
    }
    
    protected function getSubSectorsIds($draft_id)
    {
        if (!empty($draft_id)) 
        {
            $db = JFactory::getDbo();
            $query = $db->getQuery(true);
            $query->select('sc.subsector_id')
                    ->from('#__ipie_subsector_draft sc')
                    //->join('INNER', '#__ipie_subsector ss ON (ss.subsector_id=sc.subsector_id)')
                    ->where('sc.draft_id='.$draft_id)
                    ;
            $db->setQuery($query);
            return $db->loadColumn();
        } else {
            return array();
        }
    }
    
    protected function saveSectors($id, $sectors)
    {
        // delete esistenti
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query->delete('#__ipie_subsector_draft')->where('draft_id=' . $id);
        $db->setQuery($query);
        $db->execute();
        // salva correnti
        if (count($sectors)>0) {
            $query = $db->getQuery(true);
            $query->insert('#__ipie_subsector_draft')->columns('subsector_id, draft_id');
            foreach ($sectors as $s) {
                $query->values(sprintf('%d,%d', $s, $id));
            }
            $db->setQuery($query);
            if (!$db->execute()) {
                $this->setError($db->getError());
                return false;
            }
        }
        return true;
    }

    public function getLogoPath()
    {
        return JPATH_ROOT.DS.'images'.DS.'ipie'.DS.'logo'.DS;
    }
    
    public function getLogoThumbPath()
    {
        return JPATH_ROOT . DS . 'images' . DS . 'ipie' . DS . 'logo' . DS . 'thumb' . DS;
    }

    public function getLogoDraftPath()
    {
        return JPATH_ROOT . DS . 'images' . DS . 'ipie' . DS . 'logo' . DS . 'draft' . DS;
    }

    public function getLogoDraftThumbPath()
    {
        return JPATH_ROOT . DS . 'images' . DS . 'ipie' . DS . 'logo' . DS . 'draft' . DS . 'thumb' . DS;
    }
        
    protected function copyLogo($data)
    {
        // get file input
        $jinput = JFactory::getApplication()->input;
        $files = $jinput->files->get('jform');
        $file = $files['logo'];
        if (!empty($file['name']))
        {
            // generate unique filename
            $extension = end(explode('.', $file['name']));
            $filename = uniqid() . '.' . $extension;
            $path = $this->getLogoDraftPath();
            // copy file
            if (!JFile::upload($file['tmp_name'], $path.$filename)) {
                throw new Exception('Errore in copia logo', 500);
            }
            // crea miniatura
            $this->createLogoThumbnail($filename);
            // cancella eventuale file precedente
            if (!empty($data['current_logo'])) {
                JFile::delete($path.$data['current_logo']);
                $this->deleteLogoThumbnail($data['current_logo']);
            }
        } else {
            $filename = $data['current_logo'];
        }        
        return $filename;
    }


    
    protected function deleteOldLogo($id)
    {
        $item = $this->getitem($id);
        if (!empty($item->logo)) {
            JFile::delete($this->getLogoDraftPath().$item->logo);
            $this->deleteLogoThumbnail($item->logo);
        }
    }
    
    public function createLogoThumbnail($filename)
    {
        $original = $this->getLogoDraftPath().$filename;
        $thumb = $this->getLogoDraftThumbPath().$filename;
        
        $image = new JImage($original);
        $sourceWidth = $image->getWidth();
        $sourceHeight = $image->getHeight();
        $ratio = max($sourceWidth, $sourceHeight) / 200;
        $ratio = max($ratio, 1.0);
        $resizedWidth = (int)($sourceWidth / $ratio);
        $resizedHeight = (int)($sourceHeight / $ratio);
        $left = 0;
        $top = 0;
        $resized = $image->resize($resizedWidth, $resizedHeight, true, JImage::SCALE_OUTSIDE);
        $resized->toFile($thumb);
    }

    public function deleteLogoThumbnail($filename)
    {
        $path = $this->getLogoDraftThumbPath().$filename;
        if (file_exists($path)) {
            JFile::delete($path);
        }
    }
    
}