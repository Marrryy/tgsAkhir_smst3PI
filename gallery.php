<?php
session_start();

include_once "navbar.php";
?>

<div class="container">
  <div class="divider"></div>
  <h1> <i class="fa fa-picture-o" aria-hidden="true"></i> Gallery</h1>
          
<?php
    for($i=1; $i<4;$i++){
      echo '<img src="./img/kegiatan'.$i.'.jpeg" style="width:100%;height:600px;object-fit: cover; " class="img-fluid" alt="kegiatan'.$i.'">';
      echo '<div class="divider"></div>'; 
    }
?>
</div>
<div class="divider"></div>

</body>
</html>