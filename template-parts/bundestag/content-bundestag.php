
<div class="row">
    <h2 class="section-heading">Bundestag</h2>
    <div class="custom-hr">
        <span class="hr-left"></span>
    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <p>
            Seit September 2005 bin ich Mitglied im Deutschen Bundestag. Im Nachfolgenden
            möchte ich Ihnen meine Funktionen und Aufgabenbereiche dort vorstellen. Falls Sie
            Fragen dazu haben, können Sie sich gerne im Bereich <a href="service">Service</a> bei mir melden.
        </p>
    </div>
</div>
</div>
<div class="col-lg-12"></div>
</div>

<div class="row">
    <div class="separator"></div>
</div>

<div class="row">
    <div class="col-lg-12">
        <img class="divider-image" src="<?php echo get_template_directory_uri(); ?>/img/bundestag/bundestag.jpg" alt="">
    </div>
</div>

<div class="row">
    <div class="col-lg-2"></div>
    <div class="col-lg-8">
        <div class="row">
            <div class="separator"></div>
        </div>

        <div class="row">
            <div>
                <h2 class="section-heading">Funktionen</h2>
            </div>
        </div>
        <div class="custom-hr">
            <span class="hr-left"></span>
        </div>

        <div class="row">
            <div class="col-lg-4">
                <h6>Deutscher Bundestag:</h6>
                <br>
                <ul>
                    <li>Mitglied im Ältestenrat</li>
                    <li>Mitglied im Ausschuss für Kultur und Medien</li>
                    <li>Mitglied im Ausschuss für Recht und Verbraucherschutz</li>
                    <li>Mitglied im Ausschuss für Wahlprüfung, Immunität und Geschäftsordnung</li>
                    <li>Stellvertretende Vorsitzende der Parlamentariergruppe Slowakei-Tschechien-Ungarn</li>
                </ul>
            </div>
            <div class="col-lg-4">
                <h6>SPD-Bundestagsfraktion:</h6>
                <br>
                <ul>
                    <li>Parlamentarische Geschäftsführung</li>
                    <li>Stellvertretende Vorsitzende der Landesgruppe Bayern</li>
                    <li>Stellvertretende Sprecherin für Wahlprüfung, Immunität und Geschäftsführung</li>
                </ul>
            </div>
            <div class="col-lg-4">
                <h6>Weitere Gremien:</h6>
                <br>
                <ul>
                    <li>Mitglied im Arbeitskreis politische und ethische Grundfragen im Zentralkomitte der deutschen Katholiken</li>
                    <li>Mitglied im Beirat des Deutsch-Tschechischen Gesprächsforums</li>
                    <li>Mitglied im Stiftungsrat der "Stiftung Flucht, Vertreibung, Versöhnung"</li>
                    <li>Mitglied im Kuratorium der "Stiftung Denkmal für die ermordeten Juden Europas" (noch nicht bestätigt)</li>
                </ul>
            </div>
            <!--<table>
                <tr>
                    <th>Im Deutschen Bundestag bin ich</th>
                    <th>In der SPD-Bundestagsfraktion bin ich</th>
                    <th>Bei Parlamentariergruppen bin ich</th>
                </tr>
                <tr>
                    <td><li>Mitglied im Ausschuss für Bildung, Forschung und Technikfolgenabschätzung.</li></td>
                    <td><li>Parlamentarische Geschäftsführung. (seit Nov 2017)</li></td>
                    <td><li>Mitglied der Deutsch-Tschechischen Parlamentariergruppe.</li></td>
                </tr>
                <tr>
                    <td><li>Mitglied im Ausschuss für Wahlprüfung, Immunität und Geschäftsordnung.</li></td>
                    <td><li>stellvertretende Vorsitzende der bayerischen SPD-Landesgruppe.</li></td>
                    <td><li>Mitglied der Deutsch-Kanadischen Parlamentariergruppe.</li></td>
                </tr>
                <tr>
                    <td><li>stellvertretendes Mitglied im Ausschuss für Recht und Verbraucherschutz.</li></td>
                    <td><li>Mitglied der Arbeitsgruppen Bildung und Forschung, Kommunalpolitik und Bürgerschaftliches Engagement.</li></td>
                    <td><li>Mitglied der Deutsch-Mexikanischen Parlamentariergruppe.</li></td>
                </tr>
                <tr>
                    <td></td>
                    <td><li>sowie der Arbeitsgruppen Kirchenpolitik, Urheberrecht und der AWO-Parlamentariergruppe.</li></td>
                    <td></td>
                </tr>
            </table>-->
        </div>

        <!--
        <div class="row">
            <div class="col-lg-12">
                <?php
        /*        $args['category_name'] = 'reden';


                $results = new WP_Query($args);


                while($results->have_posts()) {
                    if($results->have_posts()) {
                        $results->the_post();
                        get_template_part('content', get_post_format());
                    }
                }
                wp_reset_query();
                */?>
            </div>

        </div>-->

        <div class="row">
            <div class="separator"></div>
        </div>

        <div class="row">
            <div class="col-lg-12">

                <div class="row">
                    <h2 class="section-heading">Reden im Bundestag</h2>

                    <div class="custom-hr">
                        <span class="hr-left"></span>
                    </div>
                </div>

                <div class="row">
                    <p></p>
                </div>

                <?php

                $args = array(
                    'type' => 'post',
                    'post_type' => 'reden',
                    'posts_per_page' => 1,
                );


                $results = new WP_Query($args);


                while($results->have_posts()) {
                    if($results->have_posts()) {
                        $results->the_post();
                        get_template_part('template-parts/post-formats/content', get_post_type());
                    }
                }
                wp_reset_query();
                ?>
            </div>

        </div>

        <div class="row">
            <div class="separator"></div>
        </div>