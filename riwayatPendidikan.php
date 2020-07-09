<?php
include_once "pdo.php";
include_once "function.php";
session_start();

if(!isset($_SESSION['name'])){
  die("Not logged in");
}

if($_SESSION['name'] != 'admin'){
  $_SESSION['error'] = "Not Admin";
    header("Location: index.php");
    return;
}

$stmt = getEducations($pdo);

include_once "navbar.php";
?>

<div class="container">
  <div class="divider"></div>
  <h1> </i> Riwayat Pendidikan</h1>
  <table class="table">
  <thead>
    <tr>
      <th scope="col"></th>
      <th>Tahun Masuk</th>
      <th>Tahun Lulus</th>
      <th>Tingkat Pendidikan</th>
      <th>Nama Pendidikan</th>
    </tr>
  </thead>
  <tbody>
  <?php
    while($row = $stmt->fetch(PDO::FETCH_ASSOC)){
      ?>
    <tr>
    <td><?=$row['id_pendidikan']?></td>
    <td><?=$row['tahun_masuk']?></td>
    <td><?=$row['tahun_lulus']?></td>
    <td><?=$row['tingkat_pendidikan']?></td>
    <td><?=$row['nama_pendidikan']?></td>
    </tr>
    <?php
    }
    ?>
  </tbody>
</table>                    

</div>
<div class="divider"></div>

</body>
</html>