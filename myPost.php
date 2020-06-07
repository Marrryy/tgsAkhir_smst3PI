<?php
include_once "pdo.php";
include_once "function.php";
session_start();
if(!isset($_SESSION['user_id'])){
  $_SESSION['error'] = "Please try login again";
  header("Location: index.php");
  return;
 }

?>
<?php
include_once "navbar.php";

  ?>
<div class="container">
<div class="divider"></div>

  <h1><?=$_SESSION['name']?>'s Post</h1>

<?php
$stmt = $pdo->prepare("SELECT COUNT(*) AS ct FROM posts where user_id=:id");
$stmt->execute(array(':id'=> $_SESSION['user_id']));
$count = $stmt->fetch(PDO::FETCH_ASSOC);

  flashMessage();

  echo '<p><a class="btn btn-primary" href="./addPost.php">Add New Post</a></p>';
  if($count["ct"]>0){  
    $stmt = getPostsByIdUser($pdo);

    while($row = $stmt->fetch(PDO::FETCH_ASSOC)){
      echo '<a href="./viewPost.php?post_id='.$row["post_id"].'">';
      echo'<div class="card" style="width: 18rem;">';
        echo'<div class="card-body">';
          echo'<h5 class="card-title">'.$row["headline"].'</h5>';
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