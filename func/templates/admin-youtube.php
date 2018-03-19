<?php settings_errors(); ?>
<h1>Hier können Sie alles rund um Youtube ändern</h1>
<br>

<form method="post" action="options.php">
    <?php
    settings_fields('youtube-group');
    do_settings_sections('options_template');
    submit_button();
    ?>
</form>