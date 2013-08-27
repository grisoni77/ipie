<?php

class IPieHelperRouter
{
    static function getItemid($query)
    {
        /*
        if (isset($query['view'])) 
        {
            switch ($query['view'])
            {
                case 'companies':
                    break;
                case 'company':
                    break;
            }
        }
        */
        // ritorna primo link a ipie che trovi
        $menu = JFactory::getApplication()->getMenu();
        $item = $menu->getItems(array('component'), array('com_ipie'), true);
        return $item->id;
    }
}