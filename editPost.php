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

if($row['user_id'] != $_SESSION['user_id']){
  die("ACCESS DENIED");
}

if(isset($_POST['headline']) && isset($_POST['postText'])){
  $check = validatePost();
  if($check){
    $_SESSION['error'] = $check;
    header("Location: editPost.php?post_id=".$_GET['post_id']);
    return;
  }    

  updatePost($pdo);

  $_SESSION['success'] = "Record inserted";
  header("Location:viewPost.php?post_id=".$_GET['post_id']);
  return;
} 

$hd = htmlentities($row['headline']);
$pt = htmlentities($row['postText']);
$id = $_GET['post_id'];

?>


<?php
include_once "navbar.php";

  ?>
<div class="container">
<div class="divider"></div>

<h1>Editing Post</h1>

<?php
flashMessage();
?>

</p>
<form method="post" id="form">
<input type="hidden" name="proid" value=<?=$id?>/></p>
<div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" >Headline</span>
  </div>
  <input type="text" name="headline" value=<?=$hd?> class="form-control"/>
</div>
<textarea name="postText" cols="60" rows="6"><?=$pt?></textarea>

<input class="btn btn-primary" type="submit" value="Edit">
<?php
echo '<a class="btn btn-primary" href="./viewPost.php?post_id='.$_GET['post_id'].'" role="button">Cancel</a>';
?>

</form>
</div>
<div class="divider"></div>

<script>
  CKEDITOR.replace( 'postText' );
</script>
</body>
</html>