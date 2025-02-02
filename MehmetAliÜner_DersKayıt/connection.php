<?php

$vt = new veritabani();
class Veritabani
{
    private $db;
    private $dsn;
    private $user;
    private $password;
    function __construct()
    {
        $host = $_SERVER['SERVER_NAME'];
        $this->dsn = 'mysql:host=' . $this->getHost($host) . ';dbname=obs_db;charset=utf8';
        $this->setCredentials($host);
    }
    private function getHost($host)
    {
        switch ($host) {
            case 'localhost':
                $hst = 'localhost';
                // $hst = '95.214.177.233:3306';
                break;
            case 'fi':
                $hst = 'localhost';
                break;
            default:
                $hst = 'localhost';
        }
        return $hst;
    }
    private function setCredentials($host)
    {
        // $host değerine göre kullanıcı adı ve şifreyi belirle
        switch ($host) {
            case 'localhost':
                $this->user = 'root';
                $this->password = '';
                break;
            case 'fi':
                $this->user = 'root';
                $this->password = '';
                break;
            default:
                $this->user = 'fiadm';
                $this->password = '!Fislash.2023';
        }
    }


    private function Ac()
    {
        try {
            $this->db = new PDO($this->dsn, $this->user, $this->password);
        } catch (PDOException $e) {
            echo 'Veritabanı bağlantısı başarısız oldu: ' . $e->getMessage();
        }
    }

    private function Kapat()
    {
        $this->db = null;
    }

    function listele($tablo, $diger = "")
    {
        $sonuc = null;
        $this->Ac();
        $query = $this->db->query("SELECT * FROM " . $tablo . " " . $diger, PDO::FETCH_ASSOC);
        if ($query) $sonuc = $query;
        else $sonuc = null;
        $this->Kapat();
        return $sonuc;
    }
    function ozellistele($diger = "")
    {
        $sonuc = null;
        $this->Ac();
        $query = $this->db->query($diger, PDO::FETCH_ASSOC);
        if ($query) $sonuc = $query;
        else $sonuc = null;
        $this->Kapat();
        return $sonuc;
    }
    function ekle($tablo, $veriler)
    {
        $sonuc = 0;
        $alan1 = "";
        $alan2 = "";
        foreach ($veriler as $anahtar => $deger) {
            $alan1 .= $anahtar . ",";
            $alan2 .= ":" . $anahtar . ",";
        }
        $alan1 = substr($alan1, 0, strlen($alan1) - 1);
        $alan2 = substr($alan2, 0, strlen($alan2) - 1);
        $this->Ac();
        $query = $this->db->prepare("INSERT INTO " . $tablo . " (" . $alan1 . ") VALUES (" . $alan2 . ")");
        $query->execute($veriler);
        if ($query) $sonuc = $this->db->lastInsertId();
        else $sonuc = 0;
        $this->Kapat();
        return $sonuc;
    }

    function guncelle($tablo, $veriler, $where = "")
    {
        $sonuc = "";
        $alan = "";
        foreach ($veriler as $anahtar => $deger) $alan .= $anahtar . "= :" . $anahtar . ",";
        $alan = substr($alan, 0, strlen($alan) - 1);
        if ($where != "") $where = " WHERE " . $where;
        $this->Ac();
        $query = $this->db->prepare("UPDATE " . $tablo . " SET " . $alan . $where);
        $update = $query->execute($veriler);
        if ($update) $sonuc = $query->rowCount();
        else $sonuc = 0;
        $this->Kapat();
        return $sonuc;
    }

    function sil($tablo, $where)
    {
        $this->Ac();
        $delete = $this->db->exec("DELETE FROM " . $tablo . " WHERE " . $where);
        $this->Kapat();
        return $delete;
    }
    function verisay($tablo, $diger = "")
    {
        $sonuc = null;
        $this->Ac();
        $query = $this->db->query("SELECT * FROM " . $tablo . " " . $diger);

        if ($query) {
            $sonuc = $query->rowCount();
        } else {
            $sonuc = null;
        }

        $this->Kapat();
        return $sonuc;
    }
}

?>
