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
    //require_once JPATH_SITE. '/components/'.CNL.'/helpers/router.php';
    //$query['Itemid'] = IPieHelperRouter::getItemid(array());
    
    $segments = array();
    if (isset($query['view'])) {
        switch ($query['view'])
        {
            case 'companies':
                $segments[] = 'companies';
                unset($query['view']);
                break;
                
            case 'company':
                //$segments[] = 'detail';
                $segments[] = $query['id'];
                unset($query['view']);
                unset($query['id']);
                break;
                
            case 'sector':
                if (isset($query['filter_sector'])) {
                    $segments[] = 'sector';
                    $segments[] = $query['filter_sector'];
                    unset($query['filter_sector']);
                    unset($query['layout']);
                }
                unset($query['view']);
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
        case 'companies':
            $query['view'] = 'companies';
            break;
        
        case 'sector':
            $query['view'] = 'sector';
            $query['filter_sector'] = $segments[1];
            break;
        
        default:
        case 'detail':
            $query['view'] = 'company';
            $query['id'] = $segments[0];
            break;
        
    }
    
    return $query;
}

