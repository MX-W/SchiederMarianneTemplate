$(window).scroll(function(){
    console.log($(this).scrollTop())
    if($(this).scrollTop() < 100) {
        $( ".mynav" ).css( "background-color", "rgba(255,255,255,.1)" );
    }
    if($(this).scrollTop() >= 100) {
        $( ".mynav" ).css( "background-color", "rgba(255,255,255,1)" );
    }
 });