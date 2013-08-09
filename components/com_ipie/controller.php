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
            case 'draft':
                return IPieHelperAuth::isDraftOwner();
                break;
            
            default:
                return true;
                break;
        }
    }
}

?>
