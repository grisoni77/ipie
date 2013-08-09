<?php

class modIPieSearchHelper
{
    static public function getProvinces($params = null)
    {
        require JPATH_ADMINISTRATOR.'/components/com_ipie/helpers/base.php';
        return IPieHelper::getProvinces();
    }
}
