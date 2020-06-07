<?php
include_once "pdo.php";
include_once "function.php";
session_start();
deleteComment($pdo,$_POST["delcom"]);
$_SESSION['success']="Comment deleted";
header("Location: viewPost.php?post_id=".$_POST['pid']);

?>