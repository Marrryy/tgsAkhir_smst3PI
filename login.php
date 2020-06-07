<?php
include_once "pdo.php";
include_once "function.php";

session_start();

if(isset($_POST['who']) && isset($_POST['pass'])){ 
  $check = validateUser();
  if($check){
    $_SESSION['error'] = $check;
    header("Location: login.php");
    error_log("Login fail ".$_POST['who']." $check");
    return;  
  }

    $hashing = hashPass();
  
    $stmt = $pdo->prepare("SELECT * FROM users WHERE email=:user AND password=:pass");
    $stmt->execute(array(':user'=> $_POST['who'], ':pass'=>$hashing ));
    $row = getUser($pdo, $hashing);

    $check = validateUser2($row);
    if($check) {
      $_SESSION['error'] = $check;
      header("Location: login.php");
      return;
      error_log("Login fail ".$_POST['who']." $check");
    }

    
    $_SESSION['name'] = $row['name'];
    $_SESSION['user_id'] = $row["user_id"];
    header("Location: index.php");
    return;
}

?>

<?php
include_once "navbar.php";

  ?>
<div class="container">
  <div class="divider"></div>
  <div class="text-center">
  <h1>Log in</h1>
  </div>
  
  <?php 
  flashMessage()
  ?>
<div class="row justify-content-md-center">
<form method="POST">
<label for="nam">Email</label> <br>
<input type="text" name="who" id="nam"><br/>
<label for="id_1723">Password</label><br>
<input type="password" name="pass" id="id_1723"><br/><br>
<input type="submit" class="btn btn-primary" onclick="return doValidate();" value="Log In">
<a class="btn btn-primary" href="./index.php" role="button">Cancel</a>
</form>
</div>
</div>
<div class="divider"></div>

</body>
</html>