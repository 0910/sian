$(function(){
	type_of_property = $('input#type_of_property').val();
	
	switch(type_of_property){
		case 'Luxury Properties':
			$('a.luxury').css({'background-position':'24px -127px'}); 
			break;
		case 'Urban Properties':
			$('a.urban').css({'background-position':'-148px -127px'});   
			break;
		case 'Commercial Properties':
			$('a.commercial').css({'background-position':'-322px -127px'});
			break;
		case 'Campos & Counrty Clubs':
			$('a.campos').css({'background-position':'-672px -127px'});
			break;
		case 'Developments':
			$('a.developments').css({'background-position':'-499px -127px'})
	}
});
