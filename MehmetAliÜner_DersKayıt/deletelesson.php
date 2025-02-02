<?php
include("connection.php");

if (isset($_GET['ID'])) {
    $dersID = $_GET['ID'];

    // VT nesnesi kontrolü
    if (isset($vt)) {
        
        $sil = $vt->sil('dersler', "ID={$dersID}");

        if ($sil > 0) {
            echo '<div id="custom-alert" class="custom-alert" style="background-color: rgba(0, 128, 0, 0.5);">
                    <div class="custom-alert-box">
                        <h2>Başarılı!</h2>
                        <p>Ders başarıyla silindi.</p>
                        <button id="alert-close-btn" class="btn btn-success">Tamam</button>
                    </div>
                  </div>';
            echo '<script>
                    setTimeout(function() {
                        window.location.href = "Dersler.php";
                    }, 1500);
                  </script>';
        } else {
            echo '<div id="custom-alert" class="custom-alert" style="background-color: rgba(255, 0, 0, 0.5);">
                    <div class="custom-alert-box">
                        <h2>Bir hata oluştu</h2>
                        <p>Ders silinirken bir hata oluştu.</p>
                        <button id="alert-close-btn" class="btn btn-danger">Tamam</button>
                    </div>
                  </div>';
            echo '<script>
                    setTimeout(function() {
                        window.location.href = "Dersler.php";
                    }, 1500);
                  </script>';
        }
    } else {
        echo '<div id="custom-alert" class="custom-alert" style="background-color: rgba(255, 0, 0, 0.5);">
                <div class="custom-alert-box">
                    <h2>Veritabanı Hatası</h2>
                    <p>Veritabanı bağlantısı hatası.</p>
                    <button id="alert-close-btn" class="btn btn-danger">Tamam</button>
                </div>
              </div>';
        echo '<script>
                setTimeout(function() {
                    window.location.href = "Dersler.php";
                }, 1500);
              </script>';
    }
} else {
    echo '<div id="custom-alert" class="custom-alert" style="background-color: rgba(255, 0, 0, 0.5);">
            <div class="custom-alert-box">
                <h2>Geçersiz İstek</h2>
                <p>Geçersiz istek.</p>
                <button id="alert-close-btn" class="btn btn-danger">Tamam</button>
            </div>
          </div>';
    echo '<script>
            setTimeout(function() {
                window.location.href = "Dersler.php";
            }, 1500);
          </script>';
}
?>

<!-- Custom Alert CSS -->
<style>
    .custom-alert {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.5);
        justify-content: center;
        align-items: center;
        z-index: 9999;
    }
    .custom-alert-box {
        background-color: white;
        padding: 30px;
        border-radius: 8px;
        text-align: center;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    }
    .btn {
        padding: 10px 20px;
        font-size: 16px;
        cursor: pointer;
    }
    .btn-success {
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 5px;
    }
    .btn-danger {
        background-color: #f44336;
        color: white;
        border: none;
        border-radius: 5px;
    }
    .btn-success:hover, .btn-danger:hover {
        opacity: 0.8;
    }
</style>

<!-- Custom Alert JavaScript -->
<script>
    // Show custom alert
    var alertBox = document.getElementById('custom-alert');
    if (alertBox) {
        alertBox.style.display = 'flex';
        var closeButton = document.getElementById('alert-close-btn');
        closeButton.addEventListener('click', function() {
            alertBox.style.display = 'none';
            window.location.href = "Dersler.php";
        });
    }
</script>
