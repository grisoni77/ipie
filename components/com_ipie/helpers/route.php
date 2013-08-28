<?php

// no direct access
defined('_JEXEC') or die('Restricted access');

/**
 * Helper Rp
 *
 */
class IPieHelperRoute
{

    /**
     * CUORE DEL ROUTER
     * Decide se la url si può riferire a una specifica voce di menu
     * Ha effetto sul buildroute agendo sul parametro per riferimento $query
     *
     * @param array $query
     * @return int
     */
    static public function getItemid($query)
    {
        static $a_items = null;
        static $firstitem = null;
        static $cache = array();

        // se è già stata risolta la stessa query deve essere in cache
        $key = md5(serialize($query));
        if (isset($cache[$key])) {
            return $cache[$key];
        }

        $client = JFactory::getApplication();
        $menu = $client->getMenu('site');


        if (0 === count($query))
        {
            // Ritorna il primo che trova (modo becero)
            $firstitem = $menu->getItems('component', 'com_ipie', true);
            $cache[$key] = $firstitem->id;
        }
        else
        {
            $cache[$key] = null;
            // Cerca per query
            $component = & JComponentHelper::getComponent('com_ipie');
            $items = $menu->getItems('component_id', $component->id);
            //$items = $menu->getItems('component', 'com_ipie');
            //print_r($items);

            $tot = count($items);
            $keys = array_keys($items);
            //printf('Query cercata: %s <br/> ', print_r($query, true));
            $match = false;
            for ($i=0; $i<$tot && !$match; $i++) 
            {
                $item = $items[$keys[$i]];
                $match = true;
                //printf('Query provata: %s di %d<br/> ', print_r($item->query, true), $item->id);
                foreach ($query as $k => $value)
                {
                    if (!array_key_exists($k, $item->query) || $item->query[$k] != $value) {
                        $match = false;
                        break;
                    }
                }

                if ($match) {
                    $cache[$key] = $item->id;
                    //echo 'trovata<br/>';
                    //break;
                }
            }
        }

        return $cache[$key];
    }

    /**
     * Ritorna id sluggato
     *
     * @param int $id
     * @param string $slug
     * @return string
     */
    static public function slugit($id, $slug = '')
    {
        if (!empty($slug)) {
            return $id . ':' . JFilterOutput::stringURLSafe(trim($slug));
        }
        else {
            return $id;
        }
    }

    /**
     * Ritorna id de-sluggato
     *
     * @param string $idslug
     * @return int
     */
    static public function deslugit($idslug)
    {
        return (int) current(explode('-', $idslug));
    }

    /**
     * Get link a pagina dettaglio
     *
     * @param int $id id record
     * @param string $slug testo descrittivo da aggiungere alla url (per SEF)
     * @param array $params eventuali altri parametri (array associativo)
     * @return string
     */
    static public function companyLink($id, $slug = null, $params = array())
    {
        $link = 'index.php?option=com_ipie&view=company&id=' . self::slugit($id, $slug);
        // itemid
        if (!array_key_exists('Itemid', $params) || empty($params['Itemid']))
        {
            // cerco itemid legato ad elenco
            $query = array('view' => 'companies');
            $params['Itemid'] = self::getItemid($query);
        }
        // aggiunge params
        foreach ($params as $k => $v) {
            $link .= '&' . $k . '=' . $v;
        }
        return $link;
    }

    /**
     * Get link a pagina settore
     *
     * @param int $id id record
     * @param string $slug testo descrittivo da aggiungere alla url (per SEF)
     * @param array $params eventuali altri parametri (array associativo)
     * @return string
     */
    static public function sectorLink($id, $slug = null, $params = array())
    {
        $link = 'index.php?option=com_ipie&view=sector&filter_sector=' . self::slugit($id, $slug);
        // aggiunge params
        foreach ($params as $k => $v) {
            $link .= '&' . $k . '=' . $v;
        }
        if (!isset($params['Itemid']))
        {
            // cerco itemid legato ad elenco eletti
            $query = array('view' => 'sector', 'filter_sector' => $id);
            $link .= '&Itemid=' . self::getItemid($query);
        }
        return $link;
    }

    /**
     * Get link a pagina elenco aziende
     *
     * @param int $id id record
     * @param string $slug testo descrittivo da aggiungere alla url (per SEF)
     * @param array $params eventuali altri parametri (array associativo)
     * @return string
     */
    static public function companiesLink($params = array())
    {
        $link = 'index.php?option=com_ipie&view=companies';
        // aggiunge params
        foreach ($params as $k => $v) {
            $link .= '&' . $k . '=' . $v;
        }
        if (!isset($params['Itemid']))
        {
            // cerco itemid legato ad elenco eletti
            $query = array('view' => 'companies');
            $link .= '&Itemid=' . self::getItemid($query);
        }
        return $link;
    }
    

}
