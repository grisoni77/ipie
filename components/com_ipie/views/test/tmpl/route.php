
<?php
echo JRoute::_(IPieHelperRoute::companyLink(1, 'azienda delle balle'));
?>
<br/>
<br/>
<br/>
<?php
echo JRoute::_(IPieHelperRoute::companyLink(1, 'azienda delle balle', array(
    'Itemid' => IPieHelperRoute::getItemid(array(
        'view' => 'sector',
        'filter_sector' => 1,
    ))
)));
?>
<br/>
<br/>
<br/>
<?php
echo JRoute::_(IPieHelperRoute::companyLink(1, 'azienda delle balle', array(
    'Itemid' => IPieHelperRoute::getItemid(array(
        'view' => 'sector',
        'filter_sector' => 2,
    ))
)));
?>
