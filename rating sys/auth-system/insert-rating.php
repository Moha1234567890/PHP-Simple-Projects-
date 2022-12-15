<?php require "config.php"; ?>


<?php 


if(isset($_POST["insert"])){

   

    $rating = $_POST['rating'];
    $post_id = $_POST['post_id'];
    
    $insert = $conn->prepare("INSERT INTO ratings(rate, post_id) VALUES (:rate, :post_id)");
    
    $insert-> execute([
    ':rate'=> $rating,
    ':post_id' => $post_id
    ]);
    
    }


?>