class PropertiesEnController < ApplicationController
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

    if params[:code]
      @properties = Property.find(:all, :conditions => {:code => params[:code]})
    else  
      @properties = Property.where(:type_of_property => @type_of_property).where(:country => @country).where(:location => @location).where(:type_of_operation => @type_of_operation)
    end

  end
  
  def show
    @property = Property.find(params[:id])
    @covered = @property.covered_square_meters
    @uncovered = @property.uncovered_square_meters
    unless @property.ambientes_en.nil?
      @ambientes_en = @property.ambientes_en.split(/\r\n/) 
    end
    unless @property.property_amenities_en.nil?
      @amenities_en = @property.property_amenities_en.split(/\r\n/) 
    end
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    
    if @message.valid?
      NotificationsMailer.new_message_property(@message).deliver
      redirect_to(properties_en_index_path, :notice => "Message was successfully sent.")
    else
      flash.now.alert = "Please fill all fields."
      render :new
    end
  end
end
