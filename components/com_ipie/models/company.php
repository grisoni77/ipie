<?php

class IPieSiteModelCompany extends IPieModelCompany
{

    public function __construct($config = array())
    {
        $this->option = 'com_ipie';
        
        parent::__construct($config);
    }
    
}