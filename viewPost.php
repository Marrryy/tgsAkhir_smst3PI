<?php
include_once "pdo.php";
include_once "function.php";


session_start();

if(!isset($_GET['post_id'])){
 $_SESSION['error'] = "Missing post_id";
 header("Location: index.php");
 return;
}

$row = getPostsById($pdo);
if($row === false){
    $_SESSION['error']="Could not load Post";
    header('Location: index.php');
    return;
}
?>
<?php
include_once "navbar.php";

  ?>
<div class="container">
  <div class="divider"></div>
  <?php
  if(isset($_SESSION['user_id']) && $row['user_id'] ==$_SESSION['user_id'] ){
    echo '<div class="d-inline p-2" style="float: right;">';
    echo '<form method="post" action="deletePost.php">';
    echo '<a class="btn bg-primary text-white" href="./editPost.php?post_id='.$_GET['post_id'].'" role="button">Edit</a>';
  
    echo '<input type="hidden" name="delpos" value="'.$_GET['post_id'].'"/>';
    echo '<input class="btn bg-danger text-white" type="submit" value="Delete">';
    echo '</form>';
    echo '</div>';
  }
  ?>
  <h1><?=htmlentities($row['headline'])?></h1>

  <h3>By <?=htmlentities($row['user_name'])?></h3>
  <br>
  <p><?=$row['postText']?></p>
<?php

echo '<br>';
echo '<a class="btn btn-primary" href="./addComment.php?post_id='.$_GET['post_id'].'" role="button">Add Comment</a><br><br>';

$stmt = $pdo->prepare("SELECT COUNT(*) as ct FROM comments where post_id=:id");
$stmt->execute(array(':id'=> $_GET['post_id']));
$count = $stmt->fetch(PDO::FETCH_ASSOC);
if($count["ct"]>0){  
  $stmt = getComments($pdo);

  while($rowC = $stmt->fetch(PDO::FETCH_ASSOC)){
    echo'<div class="card" style="width: 18rem;">';
      echo'<div class="card-body">';
        echo'<h5 class="card-title">'.$rowC["author"]." ";
        if(isset($_SESSION['user_id'])  && $rowC['user_id'] ==$_SESSION['user_id']){ 
          echo '<a class="btn btn-primary" href="./editComment.php?comment_id='.$rowC['comment_id'].'" role="button">Edit Comment</a>';
          }
      echo '</h5>';
        echo'<p class="card-text">'.$rowC["commentText"].'</p>';
      echo'</div>';
    echo'</div>';


  }
}else{
  echo "No comment found";  
}
?>
<br>
</div>
<div class="divider"></div>

</body>
</html>