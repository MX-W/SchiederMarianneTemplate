<div class="row">
    <div class="separator"></div>
</div>


<div class="row">
    <div class="col-lg-6 intro-container">
        <p class="intro-text">
            Seit September 2015 bin ich Mitglied im Deutschen Bundestag. Im Nachfolgenden
            möchte ich Ihnen meine Funktionen und Aufgabenbereiche dort vorstellen. Falls Sie
            Fragen dazu haben, können Sie sich gerne im Bereich <a href="kontakt">Service</a> bei mir melden.
        </p>
    </div>
    <div class="col-lg-6">
        <img class="intro-image" src="<?php echo get_template_directory_uri(); ?>/img/Rede_Bundestag.jpg" alt="">
    </div>
</div>

<div class="row">
    <div>
        <h1>Aufgabenbereiche</h1>
    </div>
</div>
<div class="custom-hr">
    <span class="hr-left"></span>
</div>

<div class="row">
    <div class="col-lg-4">
        <h6>Im Deutschen Bundestag bin ich</h6>
        <br>
        <ul>
            <li>Mitglied im Ausschuss für Bildung, Forschung und Technikfolgenabschätzung.</li>
            <li>Mitglied im Ausschuss für Wahlprüfung, Immunität und Geschäftsordnung.</li>
            <li>stellvertretendes Mitglied im Ausschuss für Recht und Verbraucherschutz.</li>
        </ul>
    </div>
    <div class="col-lg-4">
        <h6>In der SPD-Bundestagsfraktion bin ich</h6>
        <br>
        <ul>
            <li>Parlamentarische Geschäftsführung. (seit Nov 2017)</li>
            <li>stellvertretende Vorsitzende der bayerischen SPD-Landesgruppe.</li>
            <li>Mitglied der Arbeitsgruppen Bildung und Forschung, Kommunalpolitik und Bürgerschaftliches Engagement.</li>
            <li>sowie der Arbeitsgruppen Kirchenpolitik, Urheberrecht und der AWO-Parlamentariergruppe.</li>
        </ul>
    </div>
    <div class="col-lg-4">
        <h6>Bei Parlamentariergruppen bin ich</h6>
        <br>
        <ul>
            <li>Mitglied der Deutsch-Tschechischen Parlamentariergruppe.</li>
            <li>Mitglied im Ausschuss für Wahlprüfung, Immunität und Geschäftsordnung.</li>
            <li>Mitglied der Deutsch-Mexikanischen Parlamentariergruppe.</li>
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


<div class="row">
    <div class="col-lg-12">
        <?php
        $args['category_name'] = 'reden';


        $results = new WP_Query($args);


        while($results->have_posts()) {
            if($results->have_posts()) {
                $results->the_post();
                get_template_part('content', get_post_format());
            }
        }
        wp_reset_query();
        ?>
    </div>

</div>