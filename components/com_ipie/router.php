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
    
    $menu = JFactory::getApplication()->getMenu('site');
    $item = $menu->getItem($query['Itemid']);
    
    $segments = array();
    if (isset($query['view'])) {
        switch ($query['view'])
        {
            case 'registration':
                if ($item->query['view'] != 'registration') {
                    $segments[] = 'registration';
                }
                if ('success' == $query['layout']) {
                    $segments[] = 'success';
                }
                unset($query['view']);
                unset($query['layout']);
                break;
                
            case 'companies':
                $segments[] = 'companies';
                unset($query['view']);
                break;
                
            case 'company':
                $segments[] = 'detail';
                $segments[] = $query['id'];
                unset($query['view']);
                unset($query['id']);
                break;
                
            case 'draft':
                $segments[] = 'draft';
                if (isset($query['id'])) 
                {
                    $segments[] = $query['id'];
                    unset($query['id']);
                }
                unset($query['view']);
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
        case 'registration':
            $query['view'] = 'registration';
            $query['layout'] = 'edit';
            break;
        
        case 'success':
            $query['view'] = 'registration';
            $query['layout'] = 'success';
            break;
        
        case 'companies':
            $query['view'] = 'companies';
            break;
        
        case 'draft':
            $query['view'] = 'draft';
            if (isset($segments[1])) {
                $query['id'] = $segments[1];
            }
            break;
        
        case 'sector':
            $query['view'] = 'sector';
            $query['filter_sector'] = $segments[1];
            break;
        
        default:
        case 'detail':
            $query['view'] = 'company';
            $query['id'] = $segments[1];
            break;
        
    }
    
    return $query;
}

