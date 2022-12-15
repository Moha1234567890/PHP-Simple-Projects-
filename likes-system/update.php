<?php 


    require "config.php";

    if(isset($_POST['id']) AND isset($_POST['val'])) {
        $id = $_POST['id'];
        $val = $_POST['val'];

        $update = $conn->prepare("UPDATE posts SET likes = '$val' WHERE id = '$id'");
        $update->execute();
    }