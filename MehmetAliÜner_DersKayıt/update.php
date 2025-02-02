<?php

include("connection.php");

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // POST ile gelen veriler
    $id = $_POST['id'];
    $dersAdi = $_POST['dersAdi'];
    $bolum = $_POST['bolum'];
    $ogretmen = $_POST['ogretmen'];
    $kredi = $_POST['kredi'];
    $dersKodu = $_POST['dersKodu'];

    // Güncelleme işlemi
    $sonuc = $vt->guncelle(
        "dersler", // Tablo adı
        array(     // Güncellenecek alanlar ve değerler
            "DersAdi" => $dersAdi,
            "DersKodu" => $dersKodu,
            "Kredi" => $kredi,
            "OgretmenId" => $ogretmen,
            "BolumId" => $bolum
        ),
        "Id=$id"  // WHERE koşulu
    );

    if ($sonuc > 0) {
        // Başarılı güncelleme sonrası yönlendirme
        header("Location: Dersler.php?update=success");
    } else {
        // Başarısız güncelleme
        header("Location: Dersler.php?update=failure");
    }
    exit;
}
?>
