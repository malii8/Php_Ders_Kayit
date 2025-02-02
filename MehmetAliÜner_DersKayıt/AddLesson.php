<?php
include("connection.php");
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Form verilerini al
    $dersAdi = $_POST['dersAdi'] ?? null;
    $dersKodu = $_POST['dersKodu'] ?? null;
    $kredi = $_POST['kredi'] ?? null;
    $bolum = $_POST['bolum'] ?? null;
    $teacher = $_POST['teacher'] ?? null;
    // Boş alan kontrolü
    if (empty($dersAdi) || empty($dersKodu) || empty($kredi) || empty($bolum) || empty($teacher)) {
        $response = array('success' => false, 'message' => 'Boş alanlar bulunmakta, lütfen kontrol ediniz.');
        echo json_encode($response);
        exit();
    }else{
// Ders ekle
$addlesson = $vt->ekle('dersler', array(
    'DersAdi' => $dersAdi,
    'DersKodu' => $dersKodu,
    'Kredi' => $kredi,
    'OgretmenId' => $bolum,
    'BolumId' => $teacher
));
    }


    

    if ($addlesson > 0) {
        $response = array('success'=> true,''=> $addlesson);
    }
}
