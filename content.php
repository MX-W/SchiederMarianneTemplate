<?php

if(is_page('aktuelles')) { //Aktuelles
	get_template_part('template-parts/aktuelles/content-aktuelles');
}elseif(is_page('zur-person')) { //Zur Person
	get_template_part('template-parts/zur-person/content-zur-person');
}elseif(is_page('wahlkreis')) { //Wahlkreis
	get_template_part('template-parts/wahlkreis/content-wahlkreis');
}elseif(is_page('service')) { //Service
	get_template_part('template-parts/service/content-service');
}elseif(is_page('bundestag')) { //Bundestag
    get_template_part('template-parts/bundestag/content-bundestag');
}elseif(is_front_page()) { //Startseite
    get_template_part('template-parts/home/content-startseite');
}elseif(is_page('impressum')) { //Impressum
    if(have_posts()) {
        while(have_posts()) {
            the_post();
            the_content();
        }
    }
}