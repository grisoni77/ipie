<?php

// No direct access to this file
defined('_JEXEC') or die('Restricted access');

// import Joomla controller library
jimport('joomla.application.component.controller');

/**
 * Description of Controller
 *
 * @author Cristiano Cucco <cristiano dot cucco at gmail dot com>
 */
class IPieController extends JController
{

    public function __construct($config = array())
    {
        parent::__construct($config);

        $this->model_prefix = 'IPieSiteModel';
    }
    
    
    public function authorise($task)
    {
        $check = parent::authorise($task);
        
        if ($check)
        {
            switch ($task)
            {
                case 'display':
                    return $this->authoriseDisplay();
            }
        }
        
        return $check;
    }
    
    public function authoriseDisplay()
    {
        $view = JRequest::getCmd('view', $this->default_view);
        
        switch ($view)
        {
            case 'company':
                $company_id = JRequest::getInt('id');
                $model = $this->getModel('Company');
                $company = $model->getItem($id);
                return $company->published == 1;
                break;
                
            case 'draft':
                $context = "com_ipie.edit.draft";
                $draft_id = JRequest::getInt('id');
                if (!empty($draft_id)) {
                    $model = $this->getModel('Draft');
                    $user = JFactory::getUser();
                    if ($model->isDraftOwner($draft_id, $user->id)) {
                        if (!$model->isEditable($draft_id))  {
                            // non il massimo...
                            JFactory::getApplication()
                                    ->redirect(JRoute::_('index.php?option=com_ipie&task=draft.edit'));
                        } else {
                            return true;
                        }
                    } else {
                        return false;
                    }
                } else {
                    // non il massimo...
                    JFactory::getApplication()
                            ->redirect(JRoute::_('index.php?option=com_ipie&task=draft.edit'));
                }
                break;
            
            default:
                return true;
                break;
        }
    }
}

?>