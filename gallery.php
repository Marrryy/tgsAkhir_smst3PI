<?php
session_start();

include_once "navbar.php";
?>

<div class="container">
  <div class="divider"></div>
  <h1> <i class="fa fa-picture-o" aria-hidden="true"></i> Gallery</h1>
          
<?php
    for($i=1; $i<4;$i++){
      echo '<img src="./img/cover'.$i.'.png" class="img-fluid" alt="c'.$i.'">';
    }
?>
</div>
<div class="divider"></div>

</body>
</html>