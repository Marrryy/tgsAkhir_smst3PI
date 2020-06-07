<?php
include_once "pdo.php";
include_once "function.php";

session_start();
if(!isset($_SESSION['name'])){
  die("Not logged in");
}

if(isset($_POST['headline']) && isset($_POST['postText'])){  
  $check = validatePost();
  if($check){
    $_SESSION['error'] = $check;
    header("Location: addPost.php");
    return;
  }    

  $post_id = insertPost($pdo);

  if(is_numeric($post_id)){
    $_SESSION["success"]="Record Added";
    header("Location: index.php");
    return;
  }
}
?>


<?php
include_once "navbar.php";

  ?>
<div class="container">
<div class="divider"></div>

<h1>Adding Post for <?= htmlentities($_SESSION['name']);?>
</h1>

<?php
flashMessage();
?>

<form method="post">
<div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" >Headline</span>
  </div>
  <input type="text" name="headline" class="form-control"/>
</div>
<textarea name="postText" cols="60" rows="6"></textarea><br><br>
<input class="btn btn-primary" type="submit" value="Add">
<a class="btn btn-primary" href="./index.php" role="button">Cancel</a>
</form>
</div>
<div class="divider"></div>

<script>
  CKEDITOR.replace( 'postText' );
</script>
</body>
</html>