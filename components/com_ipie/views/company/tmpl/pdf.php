<?php
// english language ?
$lang = '_it';//$lingua->getBackwardLang() == 'italian' ? '' : '_eng';
// altri dati
//$associate = $firm->getAssociates()->getIterator()->current();
//$associate = current($firm->getAssociates());
//$sectors = $firm->getSectors();
//$settori = array();
//foreach ($sectors as $s) :
//    // con settori tra parentesi
//    //$settori[] = sprintf('%s (%s)', ucfirst($s->sector), $s->promopoints);
//    // senza settori tra parentesi
//  //  $settori[] = sprintf('%s', ucfirst($s->sector));  
//  $settori[] = sprintf('%s', @helper('admin::com.aziende.template.helper.model.sectorname', array('sector_id'=>$s->sector_id)));
//endforeach;
//$settore = implode(', ', $settori);
////print_r($sectors);
//// altri dati
//$associate = $firm->getAssociates()->getIterator()->current();
//$related = $firm->getRelated();
//$progspecs = $firm->getProgetti();
//$bollini = $firm->getBollini(true);

$settore = implode(', ', $sectors);

// formatting config
$fontname = 'Helvetica';
$textsize = 8;
define('VERDE1', 234);
define('VERDE2', 100);
define('VERDE3', 39);
$verde1 = VERDE1;
$verde2 = VERDE2;
$verde3 = VERDE3;


// BUILD PDF

require_once(JPATH_LIBRARIES.DS.'tcpdf_min'.DS.'config/tcpdf_config.php');
require_once(JPATH_LIBRARIES.DS.'tcpdf_min'.DS.'tcpdf.php');

class MyPDF extends TCPDF
{
    //Page header
    public function Header() {
        // get the current page break margin
        $bMargin = $this->getBreakMargin();
        // get current auto-page-break mode
        $auto_page_break = $this->AutoPageBreak;
        // disable auto-page-break
        $this->SetAutoPageBreak(false, 0);
        // set bacground image
        $header = K_PATH_IMAGES.'components'.DS.'com_ipie'.DS.'assets'.DS.'img'.DS.'pdf'.DS.'testata_2480.jpg';
        $this->Image($header, 0, 10, 210, 18.5, '', '', '', false, 300, '', false, false, 0);
        // restore auto-page-break status
        $this->SetAutoPageBreak($auto_page_break, $bMargin);
        // set the starting point for the page content
        $this->setPageMark();
    }
    //Page footer
    public function Footer() {
        // get the current page break margin
        $bMargin = $this->getBreakMargin();
        // get current auto-page-break mode
        $auto_page_break = $this->AutoPageBreak;
        // disable auto-page-break
        $this->SetAutoPageBreak(false, 0);
        // set bacground image
        $footer = K_PATH_IMAGES.'components'.DS.'com_ipie'.DS.'assets'.DS.'img'.DS.'pdf'.DS.'piede_2480.gif';
        $this->Image($footer, 0, 263.5, 210, 29.5, '', '', '', false, 300, '', false, false, 0);
        // restore auto-page-break status
        $this->SetAutoPageBreak($auto_page_break, $bMargin);
        // set the starting point for the page content
        $this->setPageMark();
    }
    
    public function headingLine($text)
    {
        $this->writeHTMLCell(210, '', $this->GetX(), '', JText::_($text), 0, 0, 0, true, 'L', true);
        $this->Ln();
        $this->SetLineWidth(0.1);
        $this->Line(PDF_MARGIN_LEFT, $this->getY(), 210-PDF_MARGIN_RIGHT, $this->getY(), 
            array('color' => array(VERDE1, VERDE2, VERDE3))
        );
    }
}

// create new PDF document
$pdf = new MyPDF('P', 'mm', PDF_PAGE_FORMAT, true, 'UTF-8', false);


// set document information
$pdf->SetCreator(JText::_('Imprese Innovative Piemonte'));
$pdf->SetAuthor(JText::_('Imprese Innovative Piemonte'));
$pdf->SetTitle($item->name);
$pdf->SetSubject(JText::_('Scheda azienda'));
$pdf->SetKeywords($item->name);
//$logo_header = 'media'.DS.'com_aziende'.DS.'img'.DS.'pdf'.DS.'logo_header.gif';
 
// set default header data
$pdf->SetHeaderData('', 35, '', '', array(0,0,0), array(0,0,0));
$pdf->setFooterData($tc=array(0,64,0), $lc=array(0,64,128));

// set header and footer fonts
$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

// set default monospaced font
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

//set margins
$pdf->SetMargins(PDF_MARGIN_LEFT, 33, PDF_MARGIN_RIGHT);
//$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
//$pdf->SetHeaderMargin(18.5);
$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);
$lineW = 210-PDF_MARGIN_LEFT-PDF_MARGIN_RIGHT;

//set auto page breaks
$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

//set image scale factor
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

//set some language-dependent strings
//$pdf->setLanguageArray($l);

// ---------------------------------------------------------

// set default font subsetting mode
$pdf->setFontSubsetting(true);

// Set font
// dejavusans is a UTF-8 Unicode font, if you only need to
// print standard ASCII chars, you can use core fonts like
// helvetica or times to reduce file size.
$pdf->SetFont($fontname, '', 14, '', true);
// Add a page
// This method has several options, check the source code documentation for more information.
$pdf->AddPage(); 

// title
$pdf->SetFont($fontname, 'B',  13, '', true);
$pdf->SetTextColor($verde1, $verde2, $verde3);
$pdf->setY($pdf->getY()+9);
$pdf->MultiCell(0, 0, $item->name, 0, 'L', 0, 1, $pdf->GetX(), $pdf->getY(), true, 0);
//$pdf->Ln();

// settore
$pdf->SetFont($fontname, '', $textsize, '', true);
$pdf->SetTextColor(0,0,0);
$pdf->setY($pdf->getY()+5);
$settori = sprintf('<strong style="color: #ea6427">%s: </strong><span>%s</span>', 
    JText::_('Settore di interesse'), $settore);
$pdf->writeHTMLCell(140, '', $pdf->GetX(), $pdf->getY(), $settori, 0, 0, 0, true, 'L', true);

function file_url($url){
  $parts = parse_url($url);
  $path_parts = array_map('rawurldecode', explode('/', $parts['path']));

  return
    $parts['scheme'] . '://' .
    $parts['host'] .
    implode('/', array_map('rawurlencode', $path_parts))
  ;
}

// put logo
$imgdata = file_get_contents(file_url(JURI::root().'images/ipie/logo/'.$item->logo));
// The '@' character is used to indicate that follows an image data stream and not an image file name
$pdf->Image('@'.$imgdata, 155, $pdf->getY(), 40, 40, '', '', '', false, 300, '', false, false, 0, 'RC');

// dati di sintesi
$pdf->Ln();
$pdf->setY($pdf->GetY()+5);
$pdf->SetFont($fontname, 'B', $textsize, '', true);
$pdf->SetTextColor($verde1, $verde2, $verde3);
$pdf->Cell(60, 0, JText::_('Dati di sintesi'), 0, 1, 'L', false);
//$pdf->Line(PDF_MARGIN_LEFT,$pdf->getY(),PDF_MARGIN_LEFT+180,$pdf->getY());

// indirizzo
//$pdf->SetFont('dejavusans', 'B', 14, '', true);
//$pdf->SetTextColor(255,0,0);
//$pdf->Cell(60, 7, JText::_('Indirizzo'), 0, 0, 'L', false);
$pdf->SetFont($fontname, '', $textsize, '', true);
$pdf->SetTextColor(0,0,0);
$pdf->Cell(160, 0, $item->address, 0, 1, 'L', false);
// email
$pdf->SetFont($fontname, '', $textsize, '', true);
$pdf->SetTextColor(0,0,0);
$pdf->Cell(160, 0, JText::_('e-mail').': '.$item->email, 0, 1, 'L', false);
// www
$pdf->SetFont($fontname, '', $textsize, '', true);
$pdf->SetTextColor(0,0,0);
$pdf->Cell(160, 0, JText::_('web').': '.$item->web, 0, 1, 'L', false);
$pdf->Ln();

$pdf->setY($pdf->GetY());
// anno di fondazione
//$pdf->SetFont($fontname, 'B', $textsize, '', true);
//$pdf->SetTextColor(255,0,0);
//$pdf->Cell(60, 7, JText::_('Anno di fondazione'), 0, 0, 'L', false);
//$pdf->SetFont($fontname, '', $textsize, '', true);
//$pdf->SetTextColor(0,0,0);
//$pdf->Cell(160, 7, $firm->firm_foundation, 0, 1, 'L', false);
// write html
$pdf->SetFont($fontname, '', $textsize, '', true);
$pdf->SetTextColor(0,0,0);
$text = sprintf('<strong style="color: #ea6427">%s: </strong><span>%s</span>', 
    JText::_('Anno di fondazione'), $item->year_foundation);
$pdf->writeHTMLCell(100, '', $pdf->GetX(), '', $text, 0, 0, 0, true, 'L', true);
$pdf->Ln();

// numero addetti
//$pdf->SetFont($fontname, 'B', $textsize, '', true);
//$pdf->SetTextColor(255,0,0);
//$pdf->Cell(60, 7, JText::_('Classe di addetti'), 0, 0, 'L', false);
//$pdf->SetFont($fontname, '', $textsize, '', true);
//$pdf->SetTextColor(0,0,0);
//$pdf->Cell(160, 7, $firm->firm_employees, 0, 1, 'L', false);
// write html
$pdf->SetFont($fontname, '', $textsize, '', true);
$pdf->SetTextColor(0,0,0);
$text = sprintf('<strong style="color: #ea6427">%s: </strong><span>%s</span>', 
    JText::_('Numero di addetti'), $item->employees);
$pdf->writeHTMLCell(100, '', $pdf->GetX(), '', $text, 0, 0, 0, true, 'L', true);

// ---------------------------------------------------------

// Fattori innovativi
$pdf->Ln();
$pdf->setY($pdf->GetY()+5);
$pdf->SetFont($fontname, 'B', $textsize, '', true);
$pdf->SetTextColor($verde1, $verde2, $verde3);
//$pdf->Cell(0, 0, ('FATTORI PER CUI L’AZIENDA &Egrave; CONSIDERATA INNOVATIVA'), 0, 1, 'L', false);
$text = 'FATTORI PER CUI';
$pdf->headingLine($text);

// set bacground image
$bimg = K_PATH_IMAGES.'images'.DS.'bollino_ipie.gif';
//echo $bimg; die();
$pdf->Image($bimg, 
210-PDF_MARGIN_RIGHT-20,   // Abscissa of the upper-left corner (LTR) or upper-right corner (RTL). 
$pdf->GetY()+2, // Ordinate of the upper-left corner (LTR) or upper-right corner (RTL).
'15', '', // width, height 
'', '', '', // type, link, align
false, 72, '', // resize, dpi, palign 
false, false, 0 // ismask, imgmask, border
);

$pdf->setY($pdf->GetY()+2);
$pdf->SetFont($fontname, '', $textsize, '', true);
$pdf->SetTextColor(0,0,0);
// formatting config
$spunta = K_PATH_IMAGES.'components'.DS.'com_ipie'.DS.'assets'.DS.'img'.DS.'pdf'.DS.'spunta_300.jpg';
$ix = PDF_MARGIN_LEFT+1;
$iw = 2; $ih = 3;
$ifb = 'LB';
$sx = 4;
$slw = 200; $slh = 3;

foreach ($item->factors as $f)
{
    $pdf->Image($spunta, $ix, $pdf->getY(), $iw, $ih, '', '', '', true, 300, '', false, false, 0, $ifb);
    $pdf->setX($pdf->GetX()+$sx);
    $pdf->Cell($slw, $slh, JText::_($f->description), 0, 1, 'L', false);
}


// output the HTML content
//$pdf->writeHTMLCell($lineW, '', $pdf->GetX(), '', $html, 0, 0, 0, true, 'L', true);
//$pdf->writeHTML($html, true, false, true, false, '');

// ---------------------------------------------------------

// Area di eccellenza
if (!empty($item->area_eccellenza)) :
$pdf->setY($pdf->GetY()+5);
$pdf->SetFont($fontname, 'B', $textsize, '', true);
$pdf->SetTextColor($verde1, $verde2, $verde3);
$text = JText::_('AREA DI ECCELLENZA');
$pdf->headingLine($text);
// testo
$pdf->setY($pdf->GetY()+2);
$pdf->SetFont($fontname, '', $textsize, '', true);
$pdf->SetTextColor(0,0,0);
$pdf->writeHTMLCell($lineW, '', $pdf->GetX(), '', $item->area_eccellenza.'<br>', 0, 0, 0, true, 'L', true);
$pdf->Ln();
endif;

// ---------------------------------------------------------

// Collaborazioni
if (!empty($item->collaborazioni)) :
$pdf->setY($pdf->GetY()+5);
$pdf->SetFont($fontname, 'B', $textsize, '', true);
$pdf->SetTextColor($verde1, $verde2, $verde3);
$text = JText::_('COLLABORAZIONI RICERCATE');
$pdf->headingLine($text);
// testo
$pdf->setY($pdf->GetY()+2);
$pdf->SetFont($fontname, '', $textsize, '', true);
$pdf->SetTextColor(0,0,0);
$pdf->writeHTMLCell($lineW, '', $pdf->GetX(), '', $item->collaborazioni.'<br>', 0, 0, 0, true, 'L', true);
$pdf->Ln();
endif;

// ---------------------------------------------------------

// Imprese correlate
if (!empty($item->related)) :
    $pdf->setY($pdf->GetY()+5);
    $pdf->SetFont($fontname, 'B', $textsize, '', true);
    $pdf->SetTextColor($verde1, $verde2, $verde3);
    //$pdf->Cell(0, 0, ('FATTORI PER CUI L’AZIENDA &Egrave; CONSIDERATA INNOVATIVA'), 0, 1, 'L', false);
    $text = 'Nella Community Imprese Innovative Piemonte ti potrebbero interessare anche';
    $pdf->headingLine($text);
    
    // formatting config
    $pdf->SetFont($fontname, '', $textsize, '', true);
    $pdf->SetTextColor(0, 0, 0);
    $spunta = K_PATH_IMAGES.'components'.DS.'com_ipie'.DS.'assets'.DS.'img'.DS.'pdf'.DS.'spunta_300.jpg';
    $ix = PDF_MARGIN_LEFT+1;
    $iw = 2; $ih = 3;
    $ifb = 'LB';
    $sx = 4;
    $slw = 80; $slh = 3;
    $acapo = false;
    $pdf->setY($pdf->GetY()+3);
    // ciclo
    foreach ($item->related as $r) :
        //$html .= '<li>'.JText::_('innovazioni di prodotto').'</li>';
        $pdf->Image($spunta, $ix+($acapo?$slw:0), $pdf->getY(), $iw, $ih, '', '', '', true, 300, '', false, false, 0, $ifb);
        $pdf->setX(PDF_MARGIN_LEFT+$sx+($acapo?$slw:0));
        $pdf->Cell($slw, $slh, $r->name, 0, ($acapo?1:0), 'L', false);
        $acapo = !$acapo;
    endforeach;
endif;


// Close and output PDF document
// This method has several options, check the source code documentation for more information.
$pdf->Output(JFilterOutput::stringURLSafe($item->name).'.pdf', 'I');

//============================================================+
// END OF FILE
//============================================================+
die();