<?php

$root = dirname(__FILE__);

echo $root;

require_once($root . '/PHPMailer/src/Exception.php');
require_once($root . '/PHPMailer/src/PHPMailer.php');
require_once($root . '/PHPMailer/src/SMTP.php');

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;


/*if(file_exists($root . '/wp-load.php')) {
    require_once($root . '/wp-load.php');
}*/

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
$subject = $_POST['subject'];
$message = $_POST['text'];
$name = $_POST['name'];

/*if($_POST['submitted']) {
	if (empty($name) || empty($message) || empty($subject) || empty($email)) {
		my_contact_form_generate_response("error", $missing_content);
	} elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
		my_contact_form_generate_response("error", $email_invalid);
	} else {
		$sent = wp_mail($to, $subject, strip_tags($message), $headers);
		if ($sent) my_contact_form_generate_response("success", $message_sent); //message sent!
		else my_contact_form_generate_response("error", $message_unsent); //message wasn't sent
	}
}*/

$mail = new PHPMailer(true);
try {
	$mail->SMTPDebug = 2;
	$mail->isSMTP();
	$mail->Host = 'smtp.1und1.de';

	$mail->SMTPAuth = true;
	$mail->Username = 'service@marianne-schieder.de';
	$mail->Password = 'Ma8619_MdB';
	$mail->SMTPSecure = 'tls';
	$mail->Port = 587;

//Recipients
	$mail->setFrom($email, $name);
	$mail->addAddress('service@marianne-schieder.de', 'Marianne Schieder, MdB');
	$mail->addCC($email, $name);
	$mail->addReplyTo($email, $name);

//Content
	$mail->isHTML(true);                                  // Set email format to HTML
	$mail->Subject = $subject;
	$mail->Body    = $message;
	$mail->AltBody = $message;

	$mail->send();
} catch(\Exception $e) {
	echo 'Message could not be sent. Mailer Error: ', $mail->ErrorInfo;
}

function my_contact_form_generate_response($type, $message){

    global $response;

    if($type == "success") $response = "<div class='success'>{$message}</div>";
    else $response = "<div class='error'>{$message}</div>";

}
header('Location: https://'. home_url() .'/wordpress/service');