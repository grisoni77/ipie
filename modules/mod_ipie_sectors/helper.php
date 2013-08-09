<?php

class modIPieSectorsHelper
{
    static public function getSectors($params = null)
    {
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query->select('*')->from('#__ipie_sector')->order('name ASC');
        $db->setQuery($query);
        //echo $db->replacePrefix($query);
        return $db->loadObjectList();
    }
}
