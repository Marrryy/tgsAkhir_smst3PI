<?php
include_once "pdo.php";
// session_start();
function storeVisitor($pdo){
    $idsession = session_id();

    $ipaddress = '';
    if(isset($_SERVER['HTTP_CLIENT_IP']))
        $ipaddress = $_SERVER['HTTP_CLIENT_IP'];
    else if(isset($_SERVER['HTTP_FORWARDED']))
        $ipaddress = $_SERVER['HTTP_FORWARDED'];
    else if(isset($_SERVER['REMOTE_ADDR']))
        $ipaddress = $_SERVER['REMOTE_ADDR'];

    $page='';
    if(isset($_SESSION['page'])) $page = $_SESSION['page'];


    $stmt =  $pdo->prepare('INSERT INTO visitors
     (idsession, ipaddress, page)
     VALUES (:ids, :ipa, :pge)');

    $stmt->execute(array(
    ':ids' =>$idsession,
    ':ipa' => $ipaddress,
    ':pge' => $page
    )); 

}

function countVisitor($pdo){
    $stmt = $pdo->query("SELECT COUNT(*) AS numvisit FROM ( SELECT * FROM visitors WHERE date(dateVisit) = CURDATE() GROUP BY idsession ) visitors");
    // $stmt = $pdo->query("SELECT * FROM visitors WHERE date(dateVisit) = CURDATE() GROUP BY idsession");
    $result = $stmt->fetch(PDO::FETCH_ASSOC);
    return $result["numvisit"];
}
function countVisitorSunday($pdo){
    $stmt = $pdo->query("SELECT COUNT(*) AS numvisit FROM ( SELECT * FROM visitors WHERE DAYOFWEEK(dateVisit) = 1 GROUP BY idsession ) visitors");
    $result = $stmt->fetch(PDO::FETCH_ASSOC);
    return $result["numvisit"];
}

function cookieLogin(){
    $cookie_name = "login";
    $cookie_value = "failed";
    setcookie($cookie_name, $cookie_value, time() + (60 * 10), "/");
}

function flashMessage(){
    if ( isset($_SESSION['error']) ) {
        echo '<p style="color:red">'.$_SESSION['error']."</p>\n";
        unset($_SESSION['error']);
      }
    if ( isset($_SESSION['success']) ) {
    echo '<p style="color:green">'.$_SESSION['success']."</p>\n";
    unset($_SESSION['success']);
    }
}

function hashPass(){
    $salt ='XyZzy12*_';
    $hashing = hash('md5', $salt.$_POST['pass']);
    return $hashing;
}

function validateUser(){
    if(!strpos($_POST['who'], '@')){
        return "Email must have an at-sign (@)";
      }
    if (strlen($_POST['pass']) < 1 ) {
        return 'All fields are required';
    }

    return false;
}

function validateUser2($row){
    if($row === false){
      return "Incorrect password or not a member";
    }
    return false;
}

function validatePost(){

    if (strlen($_POST['headline']) < 1 || strlen($_POST['postText']) < 1 ) {
        return 'All fields are required';
    }
    return false;
}


function validateComment(){

    if (strlen($_POST['commentText']) < 1  ) {
        return 'All fields are required';
    }
    return false;
}

function getUser($pdo, $hashing){
    $stmt = $pdo->prepare("SELECT * FROM users WHERE email=:user AND password=:pass");
    $stmt->execute(array(':user'=> $_POST['who'], ':pass'=>$hashing ));
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
    return $row;
}

function getPosts($pdo){
    $stmt = $pdo->query("SELECT p.post_id AS post_id,
    users.name AS user_name,
    p.headline AS headline,
    p.postText AS postText 
    FROM posts AS p LEFT JOIN users ON p.user_id = users.user_id
    ORDER BY p.created_at DESC ");
    return $stmt;
 }

function getPostsByIdUser($pdo){
    $stmt = $pdo->query("SELECT * FROM posts WHERE user_id=".$_SESSION['user_id']);
    return $stmt;
}

function getPostsById($pdo){
    $stmt = $pdo->prepare("SELECT p.post_id AS post_id,
    users.name AS user_name,
    p.headline AS headline,
    p.postText AS postText, 
    p.user_id AS user_id 
    FROM posts AS p LEFT JOIN users ON p.user_id = users.user_id
    WHERE post_id=:aid");
    $stmt->execute(array(':aid'=> $_GET['post_id']));
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
    return $row;
}

function getComments($pdo){
    $stmt = $pdo->prepare("SELECT c.commentText AS commentText,
        u.name AS author,
        c.user_id AS user_id,
        c.comment_id AS comment_id 
        FROM comments AS c 
        LEFT JOIN users AS u 
        ON c.user_id = u.user_id 
        WHERE post_id=:id
        ORDER BY c.created_at");
    $stmt->execute(array(':id'=> $_GET['post_id']));
    return $stmt;
}

function getCommentById($pdo){
    $stmt = $pdo->prepare("SELECT * FROM comments WHERE comment_id=:id");
    $stmt->execute(array(':id'=> $_GET['comment_id']));
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
    return $row;
}

function getEducations($pdo){
    $stmt = $pdo->query("SELECT * FROM pendidikan ORDER BY id_pendidikan");
    return $stmt;
}
function insertUser($pdo,$hashing){
    $stmt = $pdo->prepare('INSERT INTO Users
    (name, email, password)
    VALUES ( :nm, :em, :ps)');

    $stmt->execute(array(
    ':nm' => $_POST['username'],
    ':em' => $_POST['who'],
    ':ps' => $hashing
    )); 
     $us = $pdo->lastInsertId();
     return $us;
}

function insertPost($pdo){
    $stmt = $pdo->prepare('INSERT INTO posts
    (user_id, headline, postText)
    VALUES ( :uid, :he, :pt)');

    $stmt->execute(array(
    ':uid' => $_SESSION['user_id'],
    ':he' => $_POST['headline'],
    ':pt' => $_POST['postText'])
    ); 
     $post_id = $pdo->lastInsertId();
     return $post_id;
}

function insertComment($pdo){
    $stmt = $pdo->prepare('INSERT INTO comments 
    (post_id, user_id, commentText) 
    VALUES ( :pid, :uid, :cm)');

    $stmt->execute(array(
      ':pid' => $_GET['post_id'],
      ':uid' => $_SESSION['user_id'],
      ':cm' => $_POST['commentText'])
    );
    $comment_id = $pdo->lastInsertId();
    return $comment_id;

}


function updatePost($pdo){
    $stmt = $pdo->prepare('UPDATE posts SET 
    headline=:he, postText=:pt
    WHERE post_id = :id');
    $stmt->execute(array(
      ':id' => $_GET['post_id'],
      ':he' => $_POST['headline'],
      ':pt' => $_POST['postText'])
    );
}

function updateComment($pdo){
    $stmt = $pdo->prepare('UPDATE comments SET 
    commentText=:cm
    WHERE comment_id = :id');
    $stmt->execute(array(
        ':id' => $_GET['comment_id'],
        ':cm' => $_POST['commentText'])
    );
}

function deletePost($pdo, $post_id){
    $stmt = $pdo->prepare("DELETE FROM posts WHERE post_id=:aid");
    $stmt->execute(array(':aid'=> $post_id));
}

function deleteComment($pdo, $comment_id){
    $stmt = $pdo->prepare('DELETE FROM comments WHERE comment_id=:pid');
    $stmt->execute(array( ':pid' => $comment_id));
}

?>
