<?php

$root = dirname( dirname( dirname( __FILE__ ) ) );

require_once( $root . '/func/PHPMailer/Exception.php' );
require_once( $root . '/func/PHPMailer/PHPMailer.php' );
require_once( $root . '/func/PHPMailer/SMTP.php' );

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

$message = '';

if ( ! empty( $_POST ) ) {
	form_action();
}
function form_action() {
	global $message;

	$mail        = new PHPMailer();
	$mailContact = new PHPMailer();
	if ( isset( $_POST['g-recaptcha-response'] ) && ! empty( $_POST['g-recaptcha-response'] ) ) {
		//your site secret key
		$secret = RECAPTCHA_KEY;
		//get verify response data
		$verifyResponse = file_get_contents( 'https://www.google.com/recaptcha/api/siteverify?secret=' . $secret . '&response=' . $_POST['g-recaptcha-response'] );
		$responseData   = json_decode( $verifyResponse );
		if ( $responseData->success ) {
			try {
				$mail->SMTPDebug = SMTP_DEBUG;         // Enable verbose debug output
				$mail->isSMTP();                                        // Set mailer to use SMTP
				$mail->Host       = SMTP_HOST;               // Specify main and backup SMTP servers
				$mail->SMTPAuth   = SMTP_AUTH;           // Enable SMTP authentication
				$mail->Username   = SMTP_USER;           // SMTP username
				$mail->Password   = SMTP_PASS;           // SMTP password
				$mail->SMTPSecure = SMTP_SECURE;       // Enable TLS encryption, `ssl` also accepted
				$mail->Port       = SMTP_PORT;               // TCP port to connect to
				$mail->CharSet    = 'UTF-8';

				$mailContact->SMTPDebug = SMTP_DEBUG;         // Enable verbose debug output
				$mailContact->isSMTP();                                        // Set mailer to use SMTP
				$mailContact->Host       = SMTP_HOST;               // Specify main and backup SMTP servers
				$mailContact->SMTPAuth   = SMTP_AUTH;           // Enable SMTP authentication
				$mailContact->Username   = SMTP_USER;           // SMTP username
				$mailContact->Password   = SMTP_PASS;           // SMTP password
				$mailContact->SMTPSecure = SMTP_SECURE;       // Enable TLS encryption, `ssl` also accepted
				$mailContact->Port       = SMTP_PORT;               // TCP port to connect to
				$mailContact->CharSet    = 'UTF-8';

				//Recipients
				$mail->setFrom( 'service@marianne-schieder.de', 'Serviceformular - Marianne Schieder, MdB' );
				$mail->addAddress( 'service@marianne-schieder.de', 'Serviceformular - Marianne Schieder, MdB' );     // Add a recipient
				$mail->addReplyTo( $_POST['sm_email'], $_POST['sm_name'] );
				//$mail->addCC($_POST['sm_email']);
				//$mail->addBCC('service@marianne-schieder.de', 'Serviceformular - Marianne Schieder, MdB');

				//Content
				$mail->isHTML( true );                                  // Set email format to HTML
				$mail->Subject = 'Neue Nachricht von ' . $_POST['sm_name'] . '<' . $_POST['sm_email'] . '> auf marianne-schieder.de: "' . $_POST['sm_subject'] . '"';
				$mail->Body    = $_POST['sm_text'];
				$mail->AltBody = $_POST['sm_text'];

				//Recipients
				$mailContact->setFrom( 'service@marianne-schieder.de', 'Serviceformular - Marianne Schieder, MdB' );
				$mailContact->addAddress( $_POST['sm_email'], $_POST['sm_name'] );
				$mailContact->addReplyTo( 'service@marianne-schieder.de', 'Serviceformular - Marianne Schieder, MdB' );

				//Content
				$mailContact->isHTML( true );                                  // Set email format to HTML
				$mailContact->Subject = 'Ihre Nachricht auf marianne-schieder.de: "' . $_POST['sm_subject'] . '"';
				$mailContact->Body    = $_POST['sm_text'] . '<br> <br> <p>Vielen Dank für Ihre Nachricht. Ich melde mich bei Ihnen, so schnell es geht!</p>';
				$mailContact->AltBody = $_POST['sm_text'];

				if ( $mail->send() ) {
					$mailContact->send();
					$message = 'Vielen Dank für Ihre Nachricht. Ich melde mich bei Ihnen, so schnell es geht!';
				} else {
					$message = '';
				}
			} catch ( Exception $e ) {
				$message = 'Es gab einen Fehler. Bitte versuchen sie es erneut.';
			}
		} else {
			$message = 'Bitte füllen Sie das reCAPTCHA Feld aus.';
		}
	}
}

?>
<div class="row">
    <div class="separator"></div>
</div>
<h1 class="section-heading">Service</h1>
<div class="custom-hr">
    <span class="hr-left"></span>
</div>

<div class="row">

    <div class="col-lg-12">
        <p>
            Ganz gleich ob Sie Sorgen oder Nöte haben, ob Sie Informationen zu bestimmten Themen brauchen, oder ob Sie
            einfach mal eine Abgeordnete persönlich kennenlernen wollen: Sie dürfen jederzeit vorbeikommen.
            Meine Mitarbeiterinnen und Mitarbeiter helfen Ihnen gerne weiter. Wenn Sie mich selber treffen wollen,
            sollten Sie vorsichtshalber einen Termin vereinbaren. Rufen Sie an oder senden Sie ein E-Mail!

        </p>
    </div>
</div>
</div>
<div class="col-lg-2"></div>
</div>

<div class="row">
    <div class="separator"></div>
</div>

<div class="row">
    <div class="col-lg-12">
        <img class="divider-image" src="<?php echo get_template_directory_uri(); ?>/img/service/service.jpg" alt=""/>
    </div>
</div>

<div class="row">
    <div class="separator"></div>
</div>

<div class="row">
    <div class="col-lg-2"></div>
    <div class="col-lg-8">

        <h1 class="section-heading">Büros</h1>
        <div class="custom-hr">
            <span class="hr-left"></span>
        </div>

        <div class="row">
			<?php
			if ( ! wp_is_mobile() ) {
				?>
                <table class="table-service col-lg-12">
                    <tr class="tr-separate row">
                        <td class="heading-strong table-cell-top col-lg-4">BÜRO WERNBERG-KÖBLITZ</td>
                        <td class="heading-strong table-cell-top col-lg-4">BÜRO CHAM</td>
                        <td class="heading-strong table-cell-top col-lg-4">BÜRO BERLIN</td>
                    </tr>
                    <tr class="tr-separate row">
                        <td class="table-cell-top col-lg-4"><p>In meinem Büro in Wernberg-Köblitz steht Ihnen meine
                                Mitarbeiterin Maria Reitinger montags bis donnerstags gerne zur Verfügung. Am
                                Freitag ist Peter Wein für Sie vor Ort.</p></td>
                        <td class="table-cell-top col-lg-4"><p>Walburga Bartonizek ist Ihre Ansprechpartnerin in
                                meinem Büro in Cham. Gerne nehme auch ich mir Zeit für Sie - dazu bitte ich um
                                vorherige Terminabsprache.</p></td>
                        <td class="table-cell-top col-lg-4"><p>Im Abgeordnetenbüro in Berlin unterstützen mich
                                Ulrike Geißler, Hanna Malz und Felix Engelhard. Auch sie sind gerne bereit, sich
                                Ihrer Anliegen anzunehmen.</p></td>
                    </tr>
                    <tr class="tr-separate row">
                        <td class="table-cell-top col-lg-4">
                            <p>
                                <b>Adresse:</b><br>
                                Am Kalvarienberg 6<br>
                                92533 Wernberg-Köblitz<br>
                                <br>
                                <br>
                                <b>Tel.:</b> 09604 / 931211<br>
                                <b>Fax:</b> 09604 / 931355<br>
                                <b>Mail:</b> marianne.schieder@wk.bundestag.de<br>
                                <br>
                                <b>Öffnungszeiten:</b><br>
                                Mo. - Fr. 9.00 - 16.00 Uhr<br>
                            </p></td>
                        <td class="table-cell-top col-lg-4">
                            <p>
                                <b>Adresse:</b> <br>
                                Parkstraße 33<br>
                                93413 Cham<br>
                                <br>
                                <br>
                                <b>Tel.:</b> 09971 / 843626<br>
                                <b>Fax:</b> 09971 / 801598<br>
                                <b>Mail:</b> marianne.schieder@wk2.bundestag.de<br>
                                <br>
                                <b>Öffnungszeiten:</b><br>
                                Mo. - Fr. 9.00 - 14.00 Uhr<br>
                                und nach Vereinbarung<br>
                            </p>
                        </td>
                        <td class="table-cell-top col-lg-4">
                            <p>
                                <b>Adresse:</b><br>
                                Deutscher Bundestag<br>
                                Platz der Republik 1<br>
                                11011 Berlin <br>
                                <br>
                                <b>Tel.:</b> 030 / 227 - 72270<br>
                                <b>Fax:</b> 030 / 227 - 76268<br>
                                <b>Mail:</b> marianne.schieder@bundestag.de<br>
                                <br>
                                <b>Öffnungszeiten:</b><br>
                                Mo. - Fr. 9.00 - 16.00 Uhr<br>
                            </p>
                        </td>
                    </tr>
                </table>
				<?php
			} else {
				?>
                <div class="col-s-12">
                    <div class="row">
                        <div class="heading-strong table-cell-top col-s-12">BÜRO WERNBERG-KÖBLITZ</div>
                    </div>
                    <div class="row">
                        <div class="table-cell-top col-s-12"><p>In meinem Büro in Wernberg-Köblitz steht Ihnen meine
                                Mitarbeiterin Maria Reitinger montags bis donnerstags gerne zur Verfügung. Am
                                Freitag ist Peter Wein für Sie vor Ort.</p></div>
                    </div>
                    <div class="row">
                        <div class="table-cell-top col-s-12">
                            <p>
                                <b>Adresse:</b><br>
                                Am Kalvarienberg 6<br>
                                92533 Wernberg-Köblitz<br>
                                <br>
                                <br>
                                <b>Tel.:</b> 09604 / 931211<br>
                                <b>Fax:</b> 09604 / 931355<br>
                                <b>Mail:</b> marianne.schieder@wk.bundestag.de<br>
                                <br>
                                <b>Öffnungszeiten:</b><br>
                                Mo. - Fr. 9.00 - 16.00 Uhr<br>
                            </p></div>
                    </div>
                    <div class="row">
                        <div class="separator"></div>
                    </div>
                    <div class="row">
                        <div class="heading-strong table-cell-top col-s-12">BÜRO CHAM</div>
                    </div>
                    <div class="row">
                        <div class="table-cell-top col-s-12"><p>Walburga Bartonizek ist Ihre Ansprechpartnerin in
                                meinem Büro in Cham. Gerne nehme auch ich mir Zeit für Sie - dazu bitte ich um
                                vorherige Terminabsprache.</p></div>
                    </div>
                    <div class="row">
                        <div class="table-cell-top col-s-12">
                            <p>
                                <b>Adresse:</b> <br>
                                Parkstraße 33<br>
                                93413 Cham<br>
                                <br>
                                <br>
                                <b>Tel.:</b> 09971 / 843626<br>
                                <b>Fax:</b> 09971 / 801598<br>
                                <b>Mail:</b> marianne.schieder@wk2.bundestag.de<br>
                                <br>
                                <b>Öffnungszeiten:</b><br>
                                Mo. - Fr. 9.00 - 14.00 Uhr<br>
                                und nach Vereinbarung<br>
                            </p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="separator"></div>
                    </div>
                    <div class="row">
                        <div class="heading-strong table-cell-top col-s-12">BÜRO BERLIN</div>
                    </div>
                    <div class="row">
                        <div class="table-cell-top col-s-12"><p>Im Abgeordnetenbüro in Berlin unterstützen mich
                                Ulrike Geißler, Hanna Malz und Felix Engelhard. Auch sie sind gerne bereit, sich
                                Ihrer Anliegen anzunehmen.</p></div>
                    </div>
                    <div class="row">
                        <div class="table-cell-top col-s-12">
                            <p>
                                <b>Adresse:</b><br>
                                Deutscher Bundestag<br>
                                Platz der Republik 1<br>
                                11011 Berlin <br>
                                <br>
                                <b>Tel.:</b> 030 / 227 - 72270<br>
                                <b>Fax:</b> 030 / 227 - 76268<br>
                                <b>Mail:</b> marianne.schieder@bundestag.de<br>
                                <br>
                                <b>Öffnungszeiten:</b><br>
                                Mo. - Fr. 9.00 - 16.00 Uhr<br>
                            </p>
                        </div>
                    </div>
                </div>
				<?php
			}
			?>
        </div>

        <div class="row">
            <div class="separator"></div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <h1 class="section-heading">Pressefotos</h1>
                <div class="custom-hr">
                    <span class="hr-left"></span>
                </div>
                <h6>Für Ihre Presseberichterstattung können Sie nachfolgende Bilder gerne unter Angabe der Quelle
                    "photothek" verwenden.</h6>
                <div class="img-row">
                    <div class="img-column">
                        <img class="gallery-img rounded-lg"
                             src="<?php echo get_template_directory_uri(); ?>/img/pressefotos/_TT19335.jpg"
                             alt="Pressefoto"
                             data-toggle="modal"
                             data-target="#imageModal"
                             data-id="579"
                             onclick="galleryImageClick(event)"
                        >
                        <img class="gallery-img rounded-lg"
                             src="<?php echo get_template_directory_uri(); ?>/img/pressefotos/_TT19336.jpg"
                             alt="Pressefoto"
                             data-toggle="modal"
                             data-target="#imageModal"
                             data-id="582"
                             onclick="galleryImageClick(event)"
                        >
                        <img class="gallery-img rounded-lg"
                             src="<?php echo get_template_directory_uri(); ?>/img/pressefotos/_TT19476.jpg"
                             alt="Pressefoto"
                             data-toggle="modal"
                             data-target="#imageModal"
                             data-id="585"
                             onclick="galleryImageClick(event)"
                        >

                    </div>
                    <div class="img-column">
                        <img class="gallery-img rounded-lg"
                             src="<?php echo get_template_directory_uri(); ?>/img/pressefotos/_TT19551.jpg"
                             alt="Pressefoto"
                             data-toggle="modal"
                             data-target="#imageModal"
                             data-id="589"
                             onclick="galleryImageClick(event)"
                        >
                        <img class="gallery-img rounded-lg"
                             src="<?php echo get_template_directory_uri(); ?>/img/pressefotos/_TT19593.jpg"
                             alt="Pressefoto"
                             data-toggle="modal"
                             data-target="#imageModal"
                             data-id="592"
                             onclick="galleryImageClick(event)"

                        >
                        <img class="gallery-img rounded-lg"
                             src="<?php echo get_template_directory_uri(); ?>/img/pressefotos/_TT19674.jpg"
                             alt="Pressefoto"
                             data-toggle="modal"
                             data-target="#imageModal"
                             data-id="595"
                             onclick="galleryImageClick(event)"
                        >
                    </div>
                    <div class="img-column">
                        <img class="gallery-img rounded-lg"
                             src="<?php echo get_template_directory_uri(); ?>/img/pressefotos/_TT19758.jpg"
                             alt="Pressefoto"
                             data-toggle="modal"
                             data-target="#imageModal"
                             data-id="599"
                             onclick="galleryImageClick(event)"

                        >
                        <img class="gallery-img rounded-lg"
                             src="<?php echo get_template_directory_uri(); ?>/img/pressefotos/_TT19800.jpg"
                             alt="Pressefoto"
                             data-toggle="modal"
                             data-target="#imageModal"
                             data-id="602"
                             onclick="galleryImageClick(event)"

                        >
                        <img class="gallery-img rounded-lg"
                             src="<?php echo get_template_directory_uri(); ?>/img/pressefotos/_TT19847.jpg"
                             alt="Pressefoto"
                             data-toggle="modal"
                             data-target="#imageModal"
                             data-id="605"
                             onclick="galleryImageClick(event)"
                        >
                    </div>
                </div>
            </div>
        </div>

        <!-- Creates the bootstrap modal where the image will appear -->
        <div class="modal fade" id="imageModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-xl" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="col-lg-9">
                            <h1 class="section-heading">Pressefotos</h1>
                            <div class="custom-hr">
                                <span class="hr-left"></span>
                            </div>
                            <h6>Für Ihre Presseberichterstattung können Sie das Bild gerne unter Angabe der Quelle
                                "photothek" verwenden.</h6>
                        </div>
                        <div class="col-lg-3">
                            <div style="display: inline-flex; align-content: center; float: right;">
                                <span class="close download-text" style="align-self: center;">Download: </span>
                                <i class="fa fa-arrow-down close my-auto" id="downloadButton" onclick="downloadImage(event)"></i>
                                <i class="fa fa-times close close-modal my-auto" data-dismiss="modal" aria-label="Schließen"></i>
                            </div>

                        </div>
                    </div>
                    <div class="modal-body">
                        <img id="modal-image" style="max-width: 100%"/>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="separator"></div>
        </div>


        <div class="row">
            <div class="col-lg-12">
                <form method="post" action="">
                    <input type="hidden" name="submitted" value="1">
                    <table class="table-service-form">

                        <tr>
                            <td>
                                <h2 class="section-heading">Kontakt</h2>
                                <div class="custom-hr">
                                    <div class="hr-left"></div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                        </tr>
                        <tr>
                            <td><h6>Haben Sie Fragen, Anmerkungen oder Ideen? Gerne können Sie mir eine Nachricht
                                    senden!</h6></td>
                        </tr>
                        <tr>
                            <td>
                                <p>
									<?php
									echo $message;
									?>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="row">
                                    <div class="col-lg-5">
                                        <input name="sm_name" value="<?php if ( isset( $_POST['name'] ) ) {
											echo $_POST['name'];
										} ?>" placeholder="Name*" class="input-service" type="text" required/>
                                    </div>
                                    <div class="col-lg-2"></div>
                                    <div class="col-lg-5">
                                        <input name="sm_email" value="<?php if ( isset( $_POST['email'] ) ) {
											echo $_POST['email'];
										} ?>" placeholder="E-Mail*" class="input-service" tpye="text" required/>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input name="sm_subject" value="<?php if ( isset( $_POST['subject'] ) ) {
									echo $_POST['subject'];
								} ?>" placeholder="Betreff*" class="input-service" type="text" required/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <textarea name="sm_text" placeholder="Ihre Nachricht*" rows="7" cols="100"
                                          class="input-service" required><?php if ( isset( $_POST['text'] ) ) {
										echo $_POST['text'];
									} ?></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="recaptcha-wrapper">
                                    <div class="g-recaptcha"
                                         data-sitekey="6Lca4nUUAAAAAGALCsqq11Gei9GYywsKyjSo-Yoj"></div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input id="service-submit" name="sm_submit" value="Absenden" class="input-submit"
                                       type="submit" style="cursor: pointer;"/>
                            </td>
                        </tr>

                    </table>
                </form>
            </div>
        </div>

        <div class="row">
            <div class="separator"></div>
        </div>