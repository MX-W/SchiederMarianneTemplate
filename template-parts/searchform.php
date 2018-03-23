<form action="https://localhost/wordpress/" method="get" role="search" id="searchform" class="searchform">
	<div>
		<input type="text" value="<?php echo get_search_query(); ?>" name="s" id="s"/>
		<button type="submit" value="" class="fa fa-search site-search" id="searchsubmit"></button>
	</div>
</form>