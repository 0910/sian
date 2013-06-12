class PropertiesController < ApplicationController
  def index
  	if params[:type_of_property] == 'Todos'
  		@type_of_property = 0
  	else
	    @type_of_property = params[:type_of_property]
	  end

    if params[:country] == 'Todos'
    	@country = 0
    else
	    @country = params[:country]
	  end

	  if params[:location] == 'Todos'
	  	@location = 0
	  else
	    @location = params[:location]
	  end

	  if params[:type_of_operation] == 'Todos'
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
    @ambientes = @property.ambientes.split('') 
  end
end
