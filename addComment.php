<?php
include_once "pdo.php";
include_once "function.php";

session_start();
if(!isset($_SESSION['name'])){
  die("Not logged in");
}

if(!isset($_GET['post_id'])){
  $_SESSION['error'] = "Missing post_id";
  header("Location: index.php");
  return;
 }

if(isset($_POST['commentText'])){  
  $check = validateComment();
  if($check){
    $_SESSION['error'] = $check;
    header("Location: addComment.php?post_id=".$_GET['post_id']);
    return;
  }    

  $comment_id = insertComment($pdo);

  if(is_numeric($comment_id)){
    $_SESSION["success"]="Record Added";
    header("Location: viewPost.php?post_id=".$_GET['post_id']);
    return;
  }
}
?>


<?php
include_once "navbar.php";

  ?>
<div class="container">
<div class="divider"></div>

<h1>Adding Comment </h1>

<?php
flashMessage();
?>

<form method="post">
<textarea name="commentText" cols="60" rows="6"></textarea><br>
<input class="btn btn-primary" type="submit" value="Add">
<?php
echo '<a class="btn btn-primary" href="./viewPost.php?post_id='.$_GET["post_id"].'" role="button">Cancel</a>';
?>
</form>
</div>
<div class="divider"></div>

<script>
  CKEDITOR.replace( 'commentText' );
</script>
</body>
</html>