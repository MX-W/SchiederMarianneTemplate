<?php settings_errors(); ?>
<h1>Hier können die Informationen für die Startseite geändert werden.</h1>
<br>

<form method="post" action="options.php">
    <?php
    settings_fields('youtube-group');
    settings_fields('speech-group');
    do_settings_sections('options_template');
    submit_button();
    ?>
</form>