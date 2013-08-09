<?php

/**
 * Base helper
 *
 * @author cris
 */
class IPieHelper
{

    // plural <-> singular
    static protected $_inflector = array(
        'companies' => 'company',
        'factors' => 'factor',
        'registrations' => 'registration',
    );

    static public function isSingular($test)
    {
        $inflector = self::$_inflector;

        if (in_array($test, $inflector))
        {
            return true;
        }

        return false;
    }

    static public function getSingular($plural)
    {
        static $cache = array();

        if (isset($cache[$plural]))
        {
            return $cache[$plural];
        }

        $inflector = self::$_inflector;

        if (isset($inflector))
        {
            $cache[$plural] = isset($inflector[$plural]) ? $inflector[$plural] : $plural;
        }
        else
        {
            return false;
        }

        return $cache[$plural];
    }

    static public function getPlural($singular)
    {
        static $cache = array();

        if (isset($cache[$singular]))
        {
            return $cache[$singular];
        }

        $inflector = self::$_inflector;

        if (isset($inflector))
        {
            $reverse = array_flip($inflector);
            $cache[$singular] = isset($reverse[$singular]) ? $reverse[$singular] : $singular;
        }
        else
        {
            return false;
        }

        return $cache[$singular];
    }

    /**
     * Check XMLHttpRequest
     * 
     * @return bool true se è XHR  
     */
    static public function isAjaxRequest()
    {
        return (
                !empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest'
                );
    }
    
    
    // start DB transaction
    static public function startTransaction()
    {
        $db = JFactory::getDbo();
        $db->transactionStart();
    }
    
    // start DB transaction
    static public function commitTransaction()
    {
        $db = JFactory::getDbo();
        $db->transactionCommit();
    }
    
    // start DB transaction
    static public function rollbackTransaction()
    {
        $db = JFactory::getDbo();
        $db->transactionRollback();
    }
    

    static public function loadScript($src = 'ipie.js', $app = 'site', $inline = false)
    {
        switch ($app)
        {
            case 'site':
                $url = (JURI::root() . '/components/com_ipie/assets/js/' . $src);
                break;
            case 'admin':
                $url = (JURI::root() . '/administrator/components/com_ipie/assets/js/' . $src);
                break;
            case 'media':
                $url = (JURI::root() . '/media/com_ipie/js/libs/' . $src);
                break;
            case 'absolute':
                $url = ($src);
        }
        if ($inline) {
            printf('<script src="%s" type="text/javascript"></script>', $url);
        }
        else {
            JFactory::getDocument()->addScript($url);
        }
    }

    static public function loadJQuery()
    {
        static $loaded = false;
        if (!$loaded) {
            JFactory::getDocument()->addScript(JURI::root() . '/media/com_ipie/js/libs/jquery-1.10.0.min.js');
            JFactory::getDocument()->addScriptDeclaration('jQuery.noConflict();');
            $loaded = true;
        }
    }

    static private $geocoding_url = "http://maps.google.com/maps/api/geocode/json?sensor=false&address=";

    static public function getLocation($address)
    {
        $url = self::$geocoding_url . urlencode($address);

        $resp_json = self::curl_file_get_contents($url);
        $resp = json_decode($resp_json, true);

        if ($resp['status'] = 'OK'){
            return $resp['results'][0]['geometry']['location'];
        }
        else{
            return false;
        }
    }

    static private function curl_file_get_contents($URL)
    {
        $c = curl_init();
        curl_setopt($c, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($c, CURLOPT_URL, $URL);
        $contents = curl_exec($c);
        curl_close($c);

        if ($contents)
            return $contents;
        else
            return FALSE;
    }

    public static function getCities($province_id = 0)
    {
        $db = JFactory::getDBO();
        $where = '';
        if (!empty($province_id) && is_numeric($province_id)) {
            $where = " WHERE province_id = " . $province_id;
        }
        $sql = "SELECT city_id, name, province_id, city_id AS value, name AS text 
        FROM #__ipie_city $where ORDER BY name";
        // get comuni
        $db->setQuery($sql);
        $result = $db->loadObjectList();
        return $result;
    }

    public static function getProvinces()
    {
        $db = JFactory::getDBO();
        $sql = "SELECT province_id, name, province_id AS value, name AS text 
        FROM #__ipie_province ORDER BY name";
        // get province
        $db->setQuery($sql);
        $result = $db->loadObjectList();
        return $result;
    }

    public static function getSectors()
    {
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query->select('*')->from('#__ipie_sector');
        $db->setQuery($query);
        //echo $db->replacePrefix($query);
        return $db->loadObjectList();
    }
    
    public static function getSubSectors($sector_id)
    {
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query->select('*')->from('#__ipie_subsector')->where('sector_id='.$sector_id);
        $db->setQuery($query);
        return $db->loadObjectList();
    }
    
    public static function getFactors()
    {
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        $query->select('*')->from('#__ipie_factor');
        $db->setQuery($query);
        //echo $db->replacePrefix($query);
        return $db->loadObjectList();
    }
    
}

?>
