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

// formatting config
$fontname = 'Helvetica';
$textsize = 8;
define('VERDE1', 64);
define('VERDE2', 152);
define('VERDE3', 38);
$verde1 = VERDE1;
$verde2 = VERDE2;
$verde3 = VERDE3;


// BUILD PDF

require_once(JPATH_LIBRARIES.DS.'tcpdf_min'.DS.'config/lang/ita.php');
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
        $header = K_PATH_IMAGES.'media'.DS.'com_aziende'.DS.'img'.DS.'pdf'.DS.'testata_2480.jpg';
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
        $footer = K_PATH_IMAGES.'media'.DS.'com_aziende'.DS.'img'.DS.'pdf'.DS.'piede_2480.gif';
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
$pdf->SetCreator(JText::_('Imprese Innovative Torino'));
$pdf->SetAuthor(JText::_('Imprese Innovative Torino'));
$pdf->SetTitle($firm->firm_name);
$pdf->SetSubject(JText::_('Scheda azienda'));
$pdf->SetKeywords($firm->firm_name);
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
$pdf->setLanguageArray($l);

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
$pdf->MultiCell(0, 0, $firm->firm_name, 0, 'L', 0, 1, $pdf->GetX(), $pdf->getY(), true, 0);
//$pdf->Ln();

// settore
$pdf->SetFont($fontname, '', $textsize, '', true);
$pdf->SetTextColor(0,0,0);
$pdf->setY($pdf->getY()+5);
$settori = sprintf('<strong style="color: #409826">%s: </strong><span>%s</span>', 
    JText::_('Settore di attivi'), $settore);
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
$imgdata = file_get_contents(file_url($firm->firm_logo));
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
$pdf->Cell(160, 0, $firm->firm_address, 0, 1, 'L', false);
// email
$pdf->SetFont($fontname, '', $textsize, '', true);
$pdf->SetTextColor(0,0,0);
$pdf->Cell(160, 0, JText::_('e-mail').': '.$firm->firm_email, 0, 1, 'L', false);
// www
$pdf->SetFont($fontname, '', $textsize, '', true);
$pdf->SetTextColor(0,0,0);
$pdf->Cell(160, 0, JText::_('web').': '.$firm->firm_website, 0, 1, 'L', false);
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
$text = sprintf('<strong style="color: #409826">%s: </strong><span>%s</span>', 
    JText::_('Anno di fondazione'), $firm->firm_foundation);
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
$text = sprintf('<strong style="color: #409826">%s: </strong><span>%s</span>', 
    JText::_('Classe di addetti'), $firm->firm_employees);
$pdf->writeHTMLCell(100, '', $pdf->GetX(), '', $text, 0, 0, 0, true, 'L', true);

// ---------------------------------------------------------

// Fattori innovativi
$pdf->Ln();
$pdf->setY($pdf->GetY()+5);
$pdf->SetFont($fontname, 'B', $textsize, '', true);
$pdf->SetTextColor($verde1, $verde2, $verde3);
//$pdf->Cell(0, 0, ('FATTORI PER CUI L’AZIENDA &Egrave; CONSIDERATA INNOVATIVA'), 0, 1, 'L', false);
$text = 'FATTORI PER CUI 2';
$pdf->headingLine($text);

// set bacground image
$i = 0;
foreach ($bollini as $b) {
    $bimg = K_PATH_IMAGES.'images'.DS.'bollini'.DS.$b->image;
    //echo $bimg; die();
    $pdf->Image($bimg, 
    210-PDF_MARGIN_RIGHT-(count($bollini)-$i)*20,   // Abscissa of the upper-left corner (LTR) or upper-right corner (RTL). 
    $pdf->GetY()+2, // Ordinate of the upper-left corner (LTR) or upper-right corner (RTL).
    '15', '', // width, height 
    '', '', '', // type, link, align
    false, 72, '', // resize, dpi, palign 
    false, false, 0 // ismask, imgmask, border
    );
    $i++;
}

$pdf->setY($pdf->GetY()+2);
$pdf->SetFont($fontname, '', $textsize, '', true);
$pdf->SetTextColor(0,0,0);
// formatting config
$spunta = K_PATH_IMAGES.'media'.DS.'com_aziende'.DS.'img'.DS.'pdf'.DS.'spunta_300.jpg';
$ix = PDF_MARGIN_LEFT+1;
$iw = 2; $ih = 3;
$ifb = 'LB';
$sx = 4;
$slw = 200; $slh = 3;

//$html = '<ul style="list-style-position:inside;list-style-type:img|jpg|2|2|./media/com_aziende/img/pdf/spunta_300.jpg">';
if ($firm->firm_ai_prodotto!='No') :
    //$html .= '<li>'.JText::_('innovazioni di prodotto').'</li>';
    $pdf->Image($spunta, $ix, $pdf->getY(), $iw, $ih, '', '', '', true, 300, '', false, false, 0, $ifb);
    $pdf->setX($pdf->GetX()+$sx);
    $pdf->Cell($slw, $slh, JText::_('innovazioni di prodotto'), 0, 1, 'L', false);
endif;
if ($firm->firm_ai_processi!='No') :
    //$html .= '<li>'.JText::_('innovazione nei processi di Produzione e/o introduzione di nuove Tecnologie di produzione').'</li>';
    $pdf->Image($spunta, $ix, $pdf->getY(), $iw, $ih, '', '', '', true, 300, '', false, false, 0, $ifb);
    $pdf->setX($pdf->GetX()+$sx);
    $pdf->Cell($slw, $slh, JText::_('innovazione nei processi di Produzione e/o introduzione di nuove Tecnologie di produzione'), 0, 1, 'L', false);
endif;
if ($firm->firm_ai_rs!='No') :
    //$html .= '<li>'.JText::_('attività di ricerca e sviluppo').'</li>';
    $pdf->Image($spunta, $ix, $pdf->getY(), $iw, $ih, '', '', '', true, 300, '', false, false, 0, $ifb);
    $pdf->setX($pdf->GetX()+$sx);
    $pdf->Cell($slw, $slh, JText::_('ricerca e sviluppo'), 0, 1, 'L', false);
    //$pdf->writeHTMLCell($slw, $slh, $this->GetX(), $this->getY(), JText::_('ricerca e sviluppo'), 0, 1, false, true, 'L', true);
endif;
if ($firm->firm_ai_addetti_rs!='No') :
    //$html .= '<li>'.JText::_('addetti dedicati a ricerca e sviluppo').'</li>';
    $pdf->Image($spunta, $ix, $pdf->getY(), $iw, $ih, '', '', '', true, 300, '', false, false, 0, $ifb);
    $pdf->setX($pdf->GetX()+$sx);
    $pdf->Cell($slw, $slh, JText::_('addetti dedicati a ricerca e sviluppo'), 0, 1, 'L', false);
endif;
if ($firm->firm_ai_brevetti!='No') :
//    $html .= '<li>'.JText::_('assegnatari di Brevetti nazionali o internazionali').'</li>';
    $pdf->Image($spunta, $ix, $pdf->getY(), $iw, $ih, '', '', '', true, 300, '', false, false, 0, $ifb);
    $pdf->setX($pdf->GetX()+$sx);
    $pdf->Cell($slw, $slh, JText::_('assegnatari di Brevetti nazionali o internazionali'), 0, 1, 'L', false);
endif;
if ($firm->firm_ai_prog_eu!='No') :
//    $html .= '<li>'.JText::_('partecipazione a Progetti Europei').'</li>';
    $pdf->Image($spunta, $ix, $pdf->getY(), $iw, $ih, '', '', '', true, 300, '', false, false, 0, $ifb);
    $pdf->setX($pdf->GetX()+$sx);
    $pdf->Cell($slw, $slh, JText::_('partecipazione a Progetti Europei'), 0, 1, 'L', false);
endif;
if ($firm->firm_ai_prog_rs_regnaz!='No') :
//    $html .= '<li>'.JText::_('partecipazione a Progetti di ricerca finanziati a livello Regionale e Nazionale').'</li>';
    $pdf->Image($spunta, $ix, $pdf->getY(), $iw, $ih, '', '', '', true, 300, '', false, false, 0, $ifb);
    $pdf->setX($pdf->GetX()+$sx);
    $pdf->Cell($slw, $slh, JText::_('partecipazione a Progetti di ricerca finanziati a livello Regionale e Nazionale'), 0, 1, 'L', false);
endif;
if ($firm->firm_ai_incubatore!='No') :
//    $html .= '<li>'.JText::_('insediamento presso un incubatore di imprese innovative o in un Parco Tecnologico').'</li>';
    $pdf->Image($spunta, $ix, $pdf->getY(), $iw, $ih, '', '', '', true, 300, '', false, false, 0, $ifb);
    $pdf->setX($pdf->GetX()+$sx);
    $pdf->Cell($slw, $slh, JText::_('insediamento presso un incubatore di imprese innovative o in un Parco Tecnologico'), 0, 1, 'L', false);
endif;
//$html .= '</ul>';

// output the HTML content
//$pdf->writeHTMLCell($lineW, '', $pdf->GetX(), '', $html, 0, 0, 0, true, 'L', true);
//$pdf->writeHTML($html, true, false, true, false, '');

// ---------------------------------------------------------

// Area di eccellenza
$pdf->setY($pdf->GetY()+5);
$pdf->SetFont($fontname, 'B', $textsize, '', true);
$pdf->SetTextColor($verde1, $verde2, $verde3);
//$pdf->Cell(0, 0, ('FATTORI PER CUI L’AZIENDA &Egrave; CONSIDERATA INNOVATIVA'), 0, 1, 'L', false);
$text = 'AREA DI ECCELLENZA 2';
$pdf->headingLine($text);
// testo
$pdf->setY($pdf->GetY()+2);
$pdf->SetFont($fontname, '', $textsize, '', true);
$pdf->SetTextColor(0,0,0);
//$pdf->MultiCell($lineW, 7, $firm->{'firm_aree_eccellenza'.$lang}, 0, 'L', 0, 0, '', '', true);
$pdf->writeHTMLCell($lineW, '', $pdf->GetX(), '', $firm->{'firm_aree_eccellenza'.$lang}.'<br>', 0, 0, 0, true, 'L', true);
$pdf->Ln();

// db europeo
if (!empty($associate->id)) :
    $text = sprintf('<p>%s <a href="http://www.to.camcom.it/mercatotech" style="color:black"><strong>%s</strong></a> %s:<strong>&quot;%s&quot;</strong> (%s)<br />(Ref. %s)</p>', 
    @text('presente sul database europeo'), @text('EU Technology Market'), @text('con la tecnologia/partners search'), 
    $associate->bbs_title, $associate->bbs_abstract, $associate->bbs_code);
    $pdf->writeHTMLCell($lineW, '', $pdf->GetX(), '', $text, 0, 0, 0, true, 'L', true);
    $pdf->Ln();
endif;

// ---------------------------------------------------------

// Progetti camerali
if (count($progspecs)>0) :
    $pdf->setY($pdf->GetY()+5);
    $pdf->SetFont($fontname, 'B', $textsize, '', true);
    $pdf->SetTextColor($verde1, $verde2, $verde3);
    //$pdf->Cell(0, 0, ('FATTORI PER CUI L’AZIENDA &Egrave; CONSIDERATA INNOVATIVA'), 0, 1, 'L', false);
    $text = 'AZIENDA PARTECIPA AL PROGETTO CAMERALE 2';
    $pdf->headingLine($text);
    $i = 0;$lw = $lineW/5; $lh = 20; $sm = 3;
    foreach ($progspecs as $p) :
        $src = K_PATH_IMAGES.'images'.DS.'loghi'.DS.$p->logo;
        $pdf->Image($src, $pdf->getX()+$i*$lw, $pdf->getY()+$sm, $lw-2, $lh, '', '', '', true, 300, '', false, false, 0, 'LC');
        $i++;
        $i = $i%5;
        if ($i==0) {
            $pdf->SetY($pdf->getY()+$lh);
        }
    endforeach;
    if ($i!=0) {
        $pdf->SetY($pdf->getY()+$lh);
    }
endif;


// ---------------------------------------------------------

// Fattori innovativi
if (!empty($related)) :
    $pdf->setY($pdf->GetY()+5);
    $pdf->SetFont($fontname, 'B', $textsize, '', true);
    $pdf->SetTextColor($verde1, $verde2, $verde3);
    //$pdf->Cell(0, 0, ('FATTORI PER CUI L’AZIENDA &Egrave; CONSIDERATA INNOVATIVA'), 0, 1, 'L', false);
    $text = 'Nella Community Imprese Innovative Torino ti potrebbero interessare anche 2';
    $pdf->headingLine($text);
    
    // formatting config
    $pdf->SetFont($fontname, '', $textsize, '', true);
    $pdf->SetTextColor(0, 0, 0);
    $spunta = K_PATH_IMAGES.'media'.DS.'com_aziende'.DS.'img'.DS.'pdf'.DS.'spunta_300.jpg';
    $ix = PDF_MARGIN_LEFT+1;
    $iw = 2; $ih = 3;
    $ifb = 'LB';
    $sx = 4;
    $slw = 80; $slh = 3;
    $acapo = false;
    $pdf->setY($pdf->GetY()+3);
    // ciclo
    foreach ($related as $r) :
        //$html .= '<li>'.JText::_('innovazioni di prodotto').'</li>';
        $pdf->Image($spunta, $ix+($acapo?$slw:0), $pdf->getY(), $iw, $ih, '', '', '', true, 300, '', false, false, 0, $ifb);
        $pdf->setX(PDF_MARGIN_LEFT+$sx+($acapo?$slw:0));
        $pdf->Cell($slw, $slh, $r->firm_name, 0, ($acapo?1:0), 'L', false);
        $acapo = !$acapo;
    endforeach;
endif;


// Close and output PDF document
// This method has several options, check the source code documentation for more information.
$pdf->Output(JFilterOutput::stringURLSafe($firm->firm_name).'.pdf', 'I');

//============================================================+
// END OF FILE
//============================================================+
die();