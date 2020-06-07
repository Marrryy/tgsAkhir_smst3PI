<?php
include_once "pdo.php";
include_once "function.php";

session_start();

if(!isset($_SESSION['name'])){
  die("Not logged in");
}

if(!isset($_GET['comment_id'])){
  $_SESSION['error'] = "Missing comment_id";
  header("Location: index.php");
  return;
 }

$row = getCommentById($pdo);
if($row === false){
    $_SESSION['error']="Could not load Comment";
    header('Location: index.php');
    return;
}

if($row['user_id'] != $_SESSION['user_id']){
  die("ACCESS DENIED");
}

if(isset($_POST['commentText'])){
  $check = validateComment();
  if($check){
    $_SESSION['error'] = $check;
    header("Location: editComment.php?comment_id=".$_GET['comment_id']);
    return;
  }

  updateComment($pdo);

  $_SESSION['success'] = "Record inserted";
  header("Location:viewPost.php?post_id=".$row["post_id"]);
  return;
}

$ct = htmlentities($row['commentText']);

$id = $_GET['comment_id'];

?>



<?php
include_once "navbar.php";

  ?>
<div class="container">
<div class="divider"></div>

<h1>Editing Comment </h1>

<?php
flashMessage();
?>

<form method="post" id="form">
<input type="hidden" name="proid" value=<?=$id?>/></p>

<textarea name="commentText" cols="60" rows="6">
  <?=$ct?>
</textarea>
<input class="btn btn-primary" type="submit" value="Edit">
<?php
echo '<a class="btn btn-primary" href="./viewPost.php?post_id='.$row["post_id"].'" role="button">Cancel</a>';
?>
</form>

<form method="post" action="deleteComment.php">
<input type="hidden" name="delcom" value=<?=$id?>/></p>
<input type="hidden" name="pid" value=<?=$row['post_id']?>/></p>
<input class="btn btn-danger" type="submit" value="Delete">
</form>
</div>
<div class="divider"></div>

<script>
  CKEDITOR.replace( 'commentText' );
</script>
</body>
</html>