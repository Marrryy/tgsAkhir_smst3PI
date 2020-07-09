<?php
include_once "pdo.php";
include_once "function.php";

session_start();

if(isset($_POST['username']) && isset($_POST['who']) && isset($_POST['pass'])){ 
  if($_POST['username'] == 'admin'){
    $_SESSION['error'] = "Username can't be Admin";
    header("Location: register.php");
    return;
  }

  $check = validateUser();
  if($check){
    $_SESSION['error'] = $check;
    header("Location: register.php");
    return;  
  }
  
  $hashing = hashPass();
  $user_id = insertUser($pdo, $hashing);
  if(is_numeric($user_id)){
    $_SESSION['name'] = $_POST['username'];
    $_SESSION['user_id'] = $user_id;

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
  <div class="text-center">
  <h1>Register</h1> 
  </div>
  <?php 
  flashMessage()
  ?>
<div class="row justify-content-md-center">

<form method="POST">
<label for="username">Name: </label> <br>
<input type="text" name="username" id="username"><br/>
<label for="email">Email: </label><br>
<input type="text" name="who" id="email"><br/>
<label for="id_1723">Password: </label><br>
<input type="password" name="pass" id="id_1723"><br/><br>
<input type="submit" class="btn btn-primary" onclick="return doValidate();" value="Sign Up">
<a class="btn btn-primary" href="./index.php" role="button">Cancel</a>
</form>
</div>
</div>
<div class="divider"></div>

</body>
</html>