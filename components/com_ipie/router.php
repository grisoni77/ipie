<?php
defined('_JEXEC') or die;

/**
 * Costruisce i tipi di url:
 * - risultati cerca azienda
 * - aziende per settore
 * - scheda azienda
 * 
 * @param type $query
 */
function IPieBuildRoute(&$query)
{
    require_once JPATH_SITE. '/components/'.CNL.'/helpers/router.php';
    $query['Itemid'] = IPieHelperRouter::getItemid(array());
    
    $segments = array();
    if (isset($query['view'])) {
        switch ($query['view'])
        {
            case 'companies':
                unset($query['view']);
                if (isset($query['filter_sector'])) {
                    $segments[] = 'sector';
                    $segments[] = $query['filter_sector'];
                    unset($query['filter_sector']);
                    unset($query['layout']);
                }
                break;
        }
    }
    
    return $segments;
}

function IPieParseRoute($segments)
{
    $query = array();
    switch ($segments[0])
    {
        case 'sector':
            $query['view'] = 'companies';
            $query['layout'] = 'sector';
            $query['filter_sector'] = $segments[1];
            break;
    }
    
    return $query;
}

