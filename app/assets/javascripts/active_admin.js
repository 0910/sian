//= require active_admin/base

$(function(){
	if ($("body").hasClass("admin_properties")) {
		if($("body").hasClass("new")||$("body").hasClass("edit"))

		country = $('#property_country option:selected').val();
 		selectedCity = $('li#property_location_input option:selected').val();
 		switchLocation(country, selectedCity);

		$('#property_country').change(function(){ 
   		country = $(this).val();
   		selectedCity = '';
   		switchLocation(country, selectedCity);
		})

	};
})

function switchLocation(country, selectedCity){
	$("li#property_location_input option").attr('disabled', 'disabled');
	if(selectedCity==''){	
  	$("li#property_location_input option[value='']").attr('selected', 'selected');
	}
	switch(country){
		case('Argentina'):
	  	$("li#property_location_input option[value='CABA']").removeAttr('disabled');
	  	$("li#property_location_input option[value='Zona Norte']").removeAttr('disabled');
	  	$("li#property_location_input option[value='Gran Buenos Aires']").removeAttr('disabled');
	  	$("li#property_location_input option[value='Interior del País']").removeAttr('disabled');
			break;
		case('Uruguay'):
	  	$("li#property_location_input option[value='Montevideo']").removeAttr('disabled');
	  	$("li#property_location_input option[value='Punta del Este']").removeAttr('disabled');
	  	$("li#property_location_input option[value='Otras']").removeAttr('disabled');
	  	break;
		case('USA'):
	  	$("li#property_location_input option[value='Miami']").removeAttr('disabled');
	  	$("li#property_location_input option[value='New York']").removeAttr('disabled');
	  	$("li#property_location_input option[value='Otras']").removeAttr('disabled');
	  	break;	
	}
}