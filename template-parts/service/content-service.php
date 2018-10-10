<?php
global $response;

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
            Ganz gleich ob Sie Sorgen oder Nöte haben, ob Sie Informationen zu bestimmten Themen brauchen, oder ob Sie einfach mal eine Abgeordnete persönlich kennenlernen wollen: Sie dürfen jederzeit vorbeikommen.
             Meine Mitarbeiterinnen und Mitarbeiter helfen Ihnen gerne weiter. Wenn Sie mich selber treffen wollen, sollten Sie vorsichtshalber einen Termin vereinbaren. Rufen Sie an oder senden Sie ein E-Mail!

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
        <!--<div class="divider-opacity"></div>-->
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
            <table class="table-service col-lg-12">
                <tr class="tr-separate row">
                    <td class="heading-strong table-cell-top col-lg-4">BÜRO WERNBERG-KÖBLITZ</td>
                    <td class="heading-strong table-cell-top col-lg-4">BÜRO CHAM</td>
                    <td class="heading-strong table-cell-top col-lg-4">BÜRO BERLIN</td>
                </tr>
                <tr class="tr-separate row">
                    <td class="table-cell-top col-lg-4"><p>In meinem Büro in Wernberg-Köblitz steht Ihnen meine Mitarbeiterin Maria Reitinger montags bis donnerstags gerne zur Verfügung. Am Freitag ist Peter Wein für Sie vor Ort.</p></td>
                    <td class="table-cell-top col-lg-4"><p>Walburga Bartonizek ist Ihre Ansprechpartnerin in meinem Büro in Cham. Gerne nehme auch ich mir Zeit für Sie - dazu bitte ich um vorherige Terminabsprache.</p></td>
                    <td class="table-cell-top col-lg-4"><p>Im Abgeordnetenbüro in Berlin unterstützen mich Ulrike Geißler, Hanna Malz und Felix Engelhard. Auch sie sind gerne bereit, sich Ihrer Anliegen anzunehmen.</p></td>
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
        </div>

        <div class="row">
            <div class="separator"></div>
        </div>


        <div class="row">
            <div class="col-lg-12">
                <form action="<?php echo get_template_directory_uri() ?>/func/contact-form.php" method="post">
                    <input type="hidden" name="submitted" value="1">
                    <!--<input type="hidden" name="action" value="contact_form">-->
                <table class="table-service-form">

                        <tr>
                            <td>
                                <h2 class="section-heading">Kontakt</h2>
                                <div class="custom-hr"><div class="hr-left"></div></div>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                        </tr>
                        <tr>
                            <td><h6>Haben Sie Fragen, Anmerkungen oder Ideen? Gerne können Sie mir eine Nachricht senden!</h6></td>
                        </tr>
                    <tr>
                        <td><?php echo $response; ?></td>
                    </tr>
                        <tr>
                            <td>
                                <div class="row">
                                <div class="col-lg-5">
                                    <input name="name" value="<?php if(!empty($_POST['name'])) { echo $_POST['name'];}?>" placeholder="Name*" class="input-service" type="text"/>
                                </div>
                                <div class="col-lg-2"></div>
                                <div class="col-lg-5">
                                    <input name="email" value="<?php if(!empty($_POST['email'])) { echo $_POST['email'];}?>" placeholder="E-Mail*" class="input-service" tpye="text" />
                                </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input name="subject" value="<?php if(!empty($_POST['subject'])) { echo $_POST['subject'];}?>" placeholder="Betreff*" class="input-service" type="text"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <textarea name="text" placeholder="Ihre Nachricht*" rows="7" cols="100" class="input-service" ><?php if(!empty($_POST['text'])) { echo $_POST['text'];}?></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input id="service-submit" name="submit" value="Absenden" class="input-submit" type="submit"/>
                            </td>
                        </tr>

                </table>
                </form>
            </div>
        </div>

        <div class="row">
            <div class="separator"></div>
        </div>
