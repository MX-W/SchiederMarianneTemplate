<?php

$root = dirname(dirname(dirname(dirname(dirname(__FILE__)))));

if(file_exists($root . '/wp-load.php')) {
    require_once($root . '/wp-load.php');
}

global $response;
$response = "";
//response messages
$not_human       = "Bitte füllen Sie das reCaptcha aus.";
$missing_content = "Bitte füllen Sie alle Felder mit * aus";
$email_invalid   = "Sie haben keine korrekte E-Mail Adresse eingegeben";
$message_unsent  = "Nachricht konnte nicht versendet werden, bitte versuchen Sie es erneut.";
$message_sent    = "Vielen Dank! Ihre Nachricht wurde gesendet.";

//user posted variables
$name = $_POST['name'];
$email = $_POST['email'];
$message = $_POST['text'];
$subject = $_POST['subject'];

//php mailer variables
$to = "wendl.max@gmail.com";
$headers = 'From: '. $email . "\r\n" .
    'Cc: '. $email . "\r\n" .
    'Reply-To: ' . $email . "\r\n";

if($_POST['submitted']) {
    if (empty($name) || empty($message) || empty($subject) || empty($email)) {
        my_contact_form_generate_response("error", $missing_content);
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        my_contact_form_generate_response("error", $email_invalid);
    } else {
        $sent = wp_mail($to, $subject, strip_tags($message), $headers);
        if ($sent) my_contact_form_generate_response("success", $message_sent); //message sent!
        else my_contact_form_generate_response("error", $message_unsent); //message wasn't sent
    }
}

function my_contact_form_generate_response($type, $message){

    global $response;

    if($type == "success") $response = "<div class='success'>{$message}</div>";
    else $response = "<div class='error'>{$message}</div>";

}
header('Location: https://localhost/wordpress/service');