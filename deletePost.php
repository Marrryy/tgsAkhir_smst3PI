<?php
include_once "pdo.php";
include_once "function.php";
session_start();
deletePost($pdo, $_POST['delpos']);
$_SESSION['success']="Post deleted";
header('Location: index.php');
?>