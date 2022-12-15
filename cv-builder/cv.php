<?php
// Require composer autoload
require_once __DIR__ . '/vendor/autoload.php';
// Create an instance of the class:
$mpdf = new \Mpdf\Mpdf();

if(isset($_POST['submit'])) {
    $name = $_POST['name'];
    $address = $_POST['address'];
    $phone = $_POST['phone'];
    $email = $_POST['email'];
    $date = $_POST['date'];

    $pic = $_FILES['pic']['name'];

    $dir = 'images/'. basename($pic);

    move_uploaded_file($_FILES['pic']['tmp_name'], $dir);

    $description = $_POST['description'];
    $experience = $_POST['experience'];
    $education = $_POST['education'];
}

$html = "<!DOCTYPE html>
<html lang='en'>

<head>
    <meta charset='UTF-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>$name</title>
    <link href='style.css' rel='stylesheet'>
    <script defer src='js/script.js'></script>
</head>

<body contenteditable>
    <h1 class='naglowek'>Curriculum Vitae</h1>
    <h2>$name</h2>
    <h3 class='naglowek3'>Contact details</h3>
    <p class='condet'>Adress: $address<br>Phone: <strong>$phone</strong><br>E-mail:
        $email<br>
        Date of birth: $date</p>
    <img width='200' height='200' src='images/$pic' alt='$pic'>
    <hr>
    <h3>Description</h3>
    <p>$description</p>

    
    <hr>
    <h3>Experience</h3>
    <p> $experience
    </p>

    <hr>
    <h3>Education</h3>

    <p>$education</p>
   

</body>

</html>";


$stylesheet = file_get_contents('style.css');

$mpdf->WriteHTML($stylesheet,\Mpdf\HTMLParserMode::HEADER_CSS);
$mpdf->WriteHTML($html,\Mpdf\HTMLParserMode::HTML_BODY);


// Output a PDF file directly to the browser
$mpdf->Output('cv.pdf', 'd');
