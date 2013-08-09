<?php

/**
 * Toolbar helper
 *
 * @author cris
 */
class IPieHelperToolbar {
    
    static public function addLinkToView($view, $alt = 'back')
    {
        $bar = JToolBar::getInstance('toolbar');
		$bar->appendButton('Link', 'back', $alt, 'index.php?option='.CNL.'&view='.$view);
    }
    
}

