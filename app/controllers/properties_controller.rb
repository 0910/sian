class PropertiesController < ApplicationController
  def index
    @type_of_property = params[:type_of_property]
    @country = params[:country]
    @location = params[:location]
    @type_of_operation = params[:type_of_operation]

  	if @type_of_property
    	@properties = Property.where(:type_of_property => @type_of_property).where(:country => @country).where(:location => @location).where(:type_of_operation => @type_of_operation)
  	else	
    	@properties = Property.order('created_at desc').all
  	end
    # if defined?(params[:type_of_property])
  end
  
  def show
    @property = Property.find(params[:id])
    @covered = @property.covered_square_meters
    @uncovered = @property.uncovered_square_meters
    
  end
end
