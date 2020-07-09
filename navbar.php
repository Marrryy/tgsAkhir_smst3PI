<?php 
include_once "pdo.php";
include_once "function.php";
include_once "header.php";

storeVisitor($pdo);
$visitor = countVisitor($pdo);

$sundayVisitor = countVisitorSunday($pdo);

if(isset($_SESSION['name'])){

 ?>
  <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
      <i class="fa fa-home text-white" aria-hidden="true"></i><a class="navbar-brand" href="./index.php"> Home</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarCollapse">
        
        <div class=" mr-auto">
        <a class="navbar-brand" href="./gallery.php"> <i class="fa fa-picture-o" aria-hidden="true"></i>Gallery</a>
        <a class="navbar-brand" href="./profile.php"> <i class="fa fa-info-circle text-white" aria-hidden="true"></i>Profile</a>


        </div>
        
        <ul class="navbar-nav mt-2 mt-md-0">
  			<li class="nav-item dropdown" style="align-self: center;">
          <i class="fa fa-users text-white" aria-hidden="true"></i>
          <span style="color:white;">Sunday Visitors <?=$sundayVisitor?></span>
          <span style="color:white;">Today Visitors <?=$visitor?> </span>
		    </li>

  			<li class="nav-item dropdown">
		        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		          Hi, <?=htmlentities($_SESSION['name'])?>
		        </a>
		        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <?php 
            if($_SESSION['name'] == 'admin'){
              echo '<a class="dropdown-item" href="./riwayatPendidikan.php">Education</a>';
		          
            }
            ?>
		          <a class="dropdown-item" href="./myPost.php">My Posts</a>
		          <a class="dropdown-item" href="./addPost.php">Create Post</a>
		          <a class="dropdown-item" href="./logout.php">Log Out</a>
		        </div>
		    </li>
        </ul>
      </div>
    </nav>
    <?php
}else{
  ?>
  <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    
      <a class="navbar-brand" href="./index.php"><i class="fa fa-home text-white" aria-hidden="true"></i>Home</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav mr-auto">
         <li>
         <a class="navbar-brand" href="./gallery.php"> <i class="fa fa-picture-o" aria-hidden="true"></i>Gallery</a>
         </li>
         <li>
         <a class="navbar-brand" href="./profile.php"> <i class="fa fa-info-circle text-white" aria-hidden="true"></i>Profile</a>
         </li>

        </ul>
        <div class=" mt-2 mt-md-0">
        <span class="align-baseline">
        <i class="fa fa-users text-white" aria-hidden="true"></i>
        <span style="color:white;">Sunday Visitors <?=$sundayVisitor?></span>
        <span style="color:white;">Today Visitors <?=$visitor?></span>
        </span>

        <a href="./login.php">Please Log in</a>
        <span> / </span>
        <a href="./register.php">Register</a>
        </div>
      </div>
    </nav>

    <?php
  }
?>
