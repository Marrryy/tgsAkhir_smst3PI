<?php
include_once "pdo.php";
include_once "function.php";
session_start();

?>  

<?php
include_once "navbar.php";
?>
<div style="min-height: 55px;"></div>
<?php
include_once "carausel.php";
?>


<div class="container">
  <div class="divider"></div>
  <?php 
  flashMessage()
  ?>
  <h1>All Post</h1>


<?php

$stmt = $pdo->query("SELECT COUNT(*) AS ct FROM posts");
$count = $stmt->fetch(PDO::FETCH_ASSOC);


  if($count["ct"]>0){  
    $stmt = getPosts($pdo);

    while($row = $stmt->fetch(PDO::FETCH_ASSOC)){
      echo '<a href="./viewPost.php?post_id='.$row["post_id"].'">';
      echo'<div class="card" style="width: 18rem;">';
        echo'<div class="card-body">';
          echo'<h5 class="card-title">'.$row["headline"].'</h5>';
          echo'<h6 class="card-subtitle mb-2">By '.$row["user_name"].'</h6>';
          
    
          echo'<p class="card-text">'.$row["postText"].'</p>';
        echo'</div>';
      echo'</div>';
      echo '</a>';
    }
  }else{
    echo "No post found";  
  }
  

?>
</div>
<div class="divider"></div>

</body>
</html>