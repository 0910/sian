class PropertiesController < ApplicationController
  def index
    @properties = Property.order('created_at desc').all
  end
  
  def show
    @property = Property.find(params[:id])
    @covered = @property.covered_square_meters
    @uncovered = @property.uncovered_square_meters
    
  end
end
