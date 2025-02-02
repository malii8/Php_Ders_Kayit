<?php
include("connection.php");
$ogretmenler = $vt->listele("ogretmenler")->fetchAll(PDO::FETCH_ASSOC);
$bolumler = $vt->listele("bolumler")->fetchAll(PDO::FETCH_ASSOC);
$dersler = $vt->listele("dersler")->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html lang="en">
<style>
    body {
        background-color: #f8f9fa;
        font-family: Arial, sans-serif;
    }

    .content-page {
        padding: 20px;
    }

    .card {
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
    }

    .card-body h4 a {
        color: #007bff;
        text-decoration: none;
        font-weight: bold;
    }

    .card-body h4 a:hover {
        text-decoration: underline;
    }

    table thead {
        background-color: #e83449;
        color: #fff;
    }

    table tbody tr:hover {
        background-color: #f5f5f5;
    }

    .modal-content {
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
    }

    .modal-header {
        background-color: #007bff;
        color: #fff;
    }

    .modal-footer {
        justify-content: center;
    }

    .btn-primary {
        background-color: #e83449;
        border: none;
    }

    .btn-primary:hover {
        background-color: #ac2839;
    }

    .btn-danger {
        background-color: #ff4757;
        border: none;
    }

    .btn-danger:hover {
        background-color: #e84118;
    }
</style>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ders Ekle</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- SweetAlert2 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.8/dist/sweetalert2.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css"> <!-- Özel CSS dosyanız -->
</head>

<body>
    <div class="content-page">
        <div class="container mt-5">
            <!-- Ders Ekleme Kartı -->
            <div class="card">
                <div class="card-body text-center">
                    <i class="ti-plus" style="font-size: 50px; color: green;"></i>
                    <h4 class="mt-3">
                        <a href="#" data-bs-toggle="modal" data-bs-target="#dersEkleModal">Ders Ekle</a>
                    </h4>
                </div>
            </div>
        </div>

        <!-- Ders Listesi -->
        <div class="row mt-4">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="header-title mb-4">Ders Listesi</h4>
                        <div class="table-responsive">
                            <table class="table table-centered mb-0" id="dataTable">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Ders Adı</th>
                                        <th>Bölüm Adı</th>
                                        <th>Eğitmen</th>
                                        <th>Dersin Kodu</th>
                                        <th>Kredi</th>
                                        <th>Eklenme Tarihi</th>
                                        <th>Güncelleme</th>
                                        <th>Aksiyon</th>

                                    </tr>
                                </thead>
                                <tbody id="derslistesi">
    <?php
    if ($dersler != null) {
        $counter = 1;
        foreach ($dersler as $ders) {
            $bolumadi = $ogretmenadi = $ogretmensoyadi = "Bilinmiyor";

            foreach ($bolumler as $bolum) {
                if ($ders['BolumId'] == $bolum['Id']) {
                    $bolumadi = $bolum['BolumAdi'];
                    break;
                }
            }
            foreach ($ogretmenler as $ogretmen) {
                if ($ders['OgretmenId'] == $ogretmen['Id']) {
                    $ogretmenadi = $ogretmen['Ad'];
                    $ogretmensoyadi = $ogretmen['Soyad'];
                    break;
                }
            }

            echo "<tr>";
            echo "<td>{$counter}</td>";
            echo "<td>{$ders['DersAdi']}</td>";
            echo "<td>{$bolumadi}</td>";
            echo "<td>{$ogretmenadi} {$ogretmensoyadi}</td>";
            echo "<td>{$ders['DersKodu']}</td>";
            echo "<td>{$ders['Kredi']}</td>";
            echo "<td>{$ders['CreatedAt']}</td>";
            echo "<td>
                    <button class='btn btn-info btn-sm' 
                            data-bs-toggle='modal' 
                            data-bs-target='#updateModal'
                            data-id='{$ders['Id']}'
                            data-ad='{$ders['DersAdi']}'
                            data-bolum='{$ders['BolumId']}'
                            data-ogretmen='{$ders['OgretmenId']}'
                            data-kredi='{$ders['Kredi']}'
                            data-kod='{$ders['DersKodu']}'>
                        Güncelle
                    </button>
                  </td>";
            echo "<td><a class='btn btn-danger btn-sm' href='deletelesson.php?ID={$ders['Id']}'>Sil</a></td>";
            echo "</tr>";
            $counter++;
        }
    } else {
        echo "<tr><td colspan='8'>Ders bulunmamaktadır.</td></tr>";
    }
    ?>
</tbody>

                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


<!-- Güncelle Modal -->
<div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="updateModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form id="updateForm" method="POST" action="update.php">
                <div class="modal-header">
                    <h5 class="modal-title" id="updateModalLabel">Ders Güncelle</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="updateId" name="id">
                    <div class="mb-3">
                        <label for="updateAd" class="form-label">Ders Adı</label>
                        <input type="text" class="form-control" id="updateAd" name="dersAdi" required>
                    </div>
                    <div class="mb-3">
                        <label for="updateBolum" class="form-label">Bölüm</label>
                        <select class="form-control" id="updateBolum" name="bolum" required>
                            <option value="" disabled selected>Bölüm Seçin</option>
                            <?php foreach ($bolumler as $bolum): ?>
                                <option value="<?= $bolum['Id'] ?>"><?= $bolum['BolumAdi'] ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="updateOgretmen" class="form-label">Öğretmen</label>
                        <select class="form-control" id="updateOgretmen" name="ogretmen" required>
                            <option value="" disabled selected>Öğretmen Seçin</option>
                            <?php foreach ($ogretmenler as $ogretmen): ?>
                                <option value="<?= $ogretmen['Id'] ?>"><?= $ogretmen['Ad'] ?> <?= $ogretmen['Soyad'] ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="updateKredi" class="form-label">Kredi</label>
                        <input type="number" class="form-control" id="updateKredi" name="kredi" required>
                    </div>
                    <div class="mb-3">
                        <label for="updateKod" class="form-label">Ders Kodu</label>
                        <input type="text" class="form-control" id="updateKod" name="dersKodu" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Güncelle</button>
                </div>
            </form>
        </div>
    </div>
</div>
 




    <!-- Modal: Ders Ekle -->
    <div class="modal fade" id="dersEkleModal" tabindex="-1" aria-labelledby="dersEkleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form id="dersEkleForm" method="POST">
                    <div class="modal-header">
                        <h5 class="modal-title" id="dersEkleModalLabel">Yeni Ders Ekle</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="bolum" class="form-label">Bölüm</label>
                            <select class="form-control" id="bolum" name="bolum" required>
                                <option value="" disabled selected>Bölüm Seçin</option>
                                <?php foreach ($bolumler as $bolum): ?>
                                    <option value="<?= $bolum['Id'] ?>"><?= $bolum['BolumAdi'] ?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="dersAdi" class="form-label">Ders Adı</label>
                            <input type="text" class="form-control" id="dersAdi" name="dersAdi" required>
                        </div>
                        <div class="mb-3">
    <label for="dersKodu" class="form-label">Ders Kodu</label>
    <input type="text" class="form-control" id="dersKodu" name="dersKodu" required
           oninput="formatDersKodu(this)" placeholder="MF-BM-XXXX" maxlength="11">
</div>
                        <div class="mb-3">
                            <label for="kredi" class="form-label">Kredi</label>
                            <input type="number" class="form-control" id="kredi" name="kredi" required>
                        </div>
                        <div class="mb-3">
                            <label for="teacher" class="form-label">Öğretmen</label>
                            <select class="form-control" id="teacher" name="teacher" required>
                                <option value="" disabled selected>Öğretmen Seçin</option>
                                <?php foreach ($ogretmenler as $ogretmen): ?>
                                    <option value="<?= $ogretmen['Id'] ?>"><?= $ogretmen['Ad'] ?> <?= $ogretmen['Soyad'] ?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" id="addlesson">Ders Ekle</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- SweetAlert2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.8/dist/sweetalert2.all.min.js"></script>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function formatDersKodu(input) {
    const sabitKisim = "MF-BM-"; // Sabit format
    let girilenDeger = input.value;

    // Eğer giriş sabit kısmı içermiyorsa başına ekle
    if (!girilenDeger.startsWith(sabitKisim)) {
        girilenDeger = sabitKisim + girilenDeger.replace(sabitKisim, "");
    }

    // Sadece MF-BM- sonrası 4 karaktere izin ver
    const formatted = girilenDeger.substring(0, sabitKisim.length) +
                      girilenDeger.substring(sabitKisim.length).toUpperCase().replace(/[^A-Z0-9]/g, "").substring(0, 4);

    input.value = formatted;
}




document.addEventListener('DOMContentLoaded', () => {
    const updateModal = document.getElementById('updateModal');
    updateModal.addEventListener('show.bs.modal', function (event) {
        const button = event.relatedTarget; // Güncelle butonuna erişim
        const id = button.getAttribute('data-id');
        const ad = button.getAttribute('data-ad');
        const bolum = button.getAttribute('data-bolum');
        const ogretmen = button.getAttribute('data-ogretmen');
        const kredi = button.getAttribute('data-kredi');
        const kod = button.getAttribute('data-kod');

        // Modal içindeki alanları doldurma
        updateModal.querySelector('#updateId').value = id;
        updateModal.querySelector('#updateAd').value = ad;
        updateModal.querySelector('#updateBolum').value = bolum;
        updateModal.querySelector('#updateOgretmen').value = ogretmen;
        updateModal.querySelector('#updateKredi').value = kredi;
        updateModal.querySelector('#updateKod').value = kod;
    });
});
$(document).ready(function() {
    $('#addlesson').click(function() {
        const dersAdi = $('#dersAdi').val();
        const dersKodu = $('#dersKodu').val();
        const kredi = $('#kredi').val();
        const bolum = $('#bolum').val();
        const teacher = $('#teacher').val();

        // Alanların boş olup olmadığını kontrol et
        if (!dersAdi || !dersKodu || !kredi || !bolum || !teacher) {
            Swal.fire({
                icon: 'error',
                title: 'Hata!',
                text: 'Lütfen tüm alanları doldurun.',
                timer: 2000, // 2 saniye
                showConfirmButton: false
            }).then(() => {
                setTimeout(() => location.reload(), 2000); // 2 saniye sonra sayfayı yenile
            });
            return; // Boş alan varsa işlemi durdur
        }

        // Eğer tüm alanlar doluysa POST isteği gönder
        const data = {
            dersAdi: dersAdi,
            dersKodu: dersKodu,
            kredi: kredi,
            bolum: bolum,
            teacher: teacher
        };

        $.post('AddLesson.php', data, function(response) {
            Swal.fire('Başarılı!', 'Ders başarıyla eklendi.', 'success').then(() => location.reload());
        }).fail(() => {
            Swal.fire('Hata!', 'Ders eklenirken bir sorun oluştu.', 'error').then(() => location.reload());
        });
    });
});

    </script>
</body>

</html>
