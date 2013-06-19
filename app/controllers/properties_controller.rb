class PropertiesController < ApplicationController
  def index
  	if params[:type_of_property] == nil
  		@type_of_property = 'Luxury Properties'
  	else
	    @type_of_property = params[:type_of_property]
	  end

    if params[:country] == 'Todos los paises' || params[:country] == 'Seleccione el pais'|| params[:country] == nil 
    	@country = 0
    else
	    @country = params[:country]
	  end

	  if params[:location] == 'Todos los barrios' || params[:location] == 'Seleccione el barrio' || params[:location] == nil 
	  	@location = 0
	  else
	    @location = params[:location]
	  end

	  if params[:type_of_operation] == 'Todas las operaciones' || params[:type_of_operation] == 'Seleccione tipo de operacion' || params[:type_of_operation] == nil 
	  	@type_of_operation = 0
	  else
	    @type_of_operation = params[:type_of_operation]
	  end

  	if @type_of_property
    	@properties = Property.where(:type_of_property => @type_of_property).where(:country => @country).where(:location => @location).where(:type_of_operation => @type_of_operation)
  	else	
    	@properties = Property.order('created_at desc').all
  	end
  end
  
  def show
    @property = Property.find(params[:id])
    @covered = @property.covered_square_meters
    @uncovered = @property.uncovered_square_meters 
    @ambientes = @property.ambientes.split(/\r\n/) 
    @amenities = @property.amenities.split(/\r\n/) 
  end
end
