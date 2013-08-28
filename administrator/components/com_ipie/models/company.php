<?php

// No direct access to this file
defined('_JEXEC') or die('Restricted access');

/**
 * Facility Model
 */
class IPieModelCompany extends IPieModelAdmin
{

    public function __construct($config = array())
    {
        parent::__construct($config);

        $this->event_before_delete = 'onBeforeCompanyDelete';
        $this->event_after_delete = 'onAfterCompanyDelete';
        $dispatcher = JDispatcher::getInstance();
        $dispatcher->register($this->event_before_delete, 'IPiePluginCompany');
        $dispatcher->register($this->event_after_delete, 'IPiePluginCompany');
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
            $data->sectors = $this->getSubSectorsIds($data->company_id);
            $data->factors = $this->getFactorsIds($data->company_id);
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

    public function save($data, $reset_draft = true)
    {
        // ricava logo
        if (empty($data['logo'])) {
            $data['logo'] = $this->copyLogo($data);
        }
        else {
            $this->deleteOldLogo($data['company_id']);
        }
        // save
        $res = parent::save($data);
        // se ok salva anche dati accessori
        if ($res)
        {
            // get company_id
            $id = $this->getState($this->getName() . '.id');
            $this->saveSectors($id, $data['sectors']);
            $this->saveFactors($id, $data['factors']);

            // se richiesto salva anche il draft allineandolo ai nuovi dati
            if ($reset_draft)
            {
                // cancella il draft esistente
                $this->deleteDraft($id);
                // copia immagine per draft
                if (!empty($data['logo'])) {
                    if (!file_exists($this->getLogoDraftPath())) {
                        JFolder::create($this->getLogoDraftPath());
                    }
                    JFile::copy($this->getLogoPath() . $data['logo'], $this->getLogoDraftPath() . $data['logo']);
                    if (!file_exists($this->getLogoDraftThumbPath())) {
                        JFolder::create($this->getLogoDraftThumbPath());
                    }
                    JFile::copy($this->getLogoThumbPath() . $data['logo'], $this->getLogoDraftThumbPath() . $data['logo']);
                }
                // salva nuovo draft
                $data['company_id'] = $id;
                $model = JModel::getInstance('Draft', 'IPieModel');
                if (!$model->save($data)) {
                    throw new Exception($model->getError(), 400);
                }
            }
        }
        return $res;
    }
    
    public function deleteDraft($company_id)
    {
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query->select('draft_id')->from('#__ipie_draft')->where('company_id=' . $company_id);
        $db->setQuery($query);
        $draft_id = $db->loadResult();
        $model = JModel::getInstance('Draft', 'IPieModel');
        $model->delete($draft_id);
    }

    protected function getSubSectorsIds($company_id)
    {
        if (!empty($company_id))
        {
            $db = JFactory::getDbo();
            $query = $db->getQuery(true);
            $query->select('sc.subsector_id')
                    ->from('#__ipie_subsector_company sc')
                    //->join('INNER', '#__ipie_subsector ss ON (ss.subsector_id=sc.subsector_id)')
                    ->where('sc.company_id=' . $company_id)
            ;
            $db->setQuery($query);
            return $db->loadColumn();
        }
        else {
            return array();
        }
    }

    protected function getFactorsIds($company_id)
    {
        if (!empty($company_id))
        {
            $db = JFactory::getDbo();
            $query = $db->getQuery(true);
            $query->select('fc.factor_id')
                    ->from('#__ipie_factor_company fc')
                    //->join('INNER', '#__ipie_factor f ON (f.factor_id=.fc.factor_id)')
                    ->where('fc.company_id=' . $company_id)
            ;
            $db->setQuery($query);
            //echo $db->replacePrefix($query);
            return $db->loadColumn();
        }
        else {
            return array();
        }
    }

    protected function saveSectors($id, $sectors)
    {
        // delete esistenti
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query->delete('#__ipie_subsector_company')->where('company_id=' . $id);
        $db->setQuery($query);
        $db->execute();
        // salva correnti
        if (count($sectors) > 0) {
            $query = $db->getQuery(true);
            $query->insert('#__ipie_subsector_company')->columns('subsector_id, company_id');
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

    protected function saveFactors($id, $factors)
    {
        // delete esistenti
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query->delete('#__ipie_factor_company')->where('company_id=' . $id);
        $db->setQuery($query);
        $db->execute();
        // salva correnti
        if (count($factors) > 0) {
            $query = $db->getQuery(true);
            $query->insert('#__ipie_factor_company')->columns('factor_id, company_id');
            foreach ($factors as $s) {
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
        return JPATH_ROOT . DS . 'images' . DS . 'ipie' . DS . 'logo' . DS;
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
            $path = $this->getLogoPath();
            // copy file
            if (!JFile::upload($file['tmp_name'], $path . $filename)) {
                throw new Exception('Errore in copia logo', 500);
            }
            // crea miniatura
            $this->createLogoThumbnail($filename);
            // cancella eventuale file precedente
            if (!empty($data['current_logo'])) {
                JFile::delete($path . $data['current_logo']);
                // delete miniatura
                $this->deleteLogoThumbnail($data['current_logo']);
            }
        }
        else {
            $filename = $data['current_logo'];
        }
        return $filename;
    }

    protected function deleteOldLogo($id)
    {
        $item = $this->getitem($id);
        if (!empty($item->logo)) {
            JFile::delete($this->getLogoPath() . $item->logo);
            $this->deleteLogoThumbnail($item->logo);
        }
    }

    public function createLogoThumbnail($filename)
    {
        $original = $this->getLogoPath().$filename;
        $thumb = $this->getLogoThumbPath().$filename;
        
        if (!$image = new JImage($original)) {
            JFactory::getApplication()->enqueueMessage('errore in open image', 'error');
        }
        $sourceWidth = $image->getWidth();
        $sourceHeight = $image->getHeight();
        $ratio = max($sourceWidth, $sourceHeight) / 200;
        $ratio = max($ratio, 1.0);
        $resizedWidth = (int)($sourceWidth / $ratio);
        $resizedHeight = (int)($sourceHeight / $ratio);
        $left = 0;
        $top = 0;
        $resized = $image->resize($resizedWidth, $resizedHeight, true, JImage::SCALE_OUTSIDE);
        if (!file_exists($this->getLogoThumbPath())) {
            JFolder::create($this->getLogoThumbPath());
        }
        $resized->toFile($thumb);
    }

    public function deleteLogoThumbnail($filename)
    {
        $path = $this->getLogoThumbPath().$filename;
        if (file_exists($path)) {
            JFile::delete($path);
        }
    }

}