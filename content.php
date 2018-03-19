<?php

if(is_page(57)) { //Aktuelles
	get_template_part('template-parts/aktuelles/content-aktuelles');
}elseif(is_page(59)) { //Zur Person
	get_template_part('template-parts/zur-person/content-zur-person');
}elseif(is_page(61)) { //Wahlkreis
	get_template_part('template-parts/wahlkreis/content-wahlkreis');
}elseif(is_page(67)) { //Service
	get_template_part('template-parts/service/content-service');
}elseif(is_page(63)) { //Bundestag
    get_template_part('template-parts/bundestag/content-bundestag');
}elseif(is_front_page()) { //Startseite
    get_template_part('template-parts/home/content-startseite');
}