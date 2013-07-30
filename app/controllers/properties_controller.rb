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

    if params[:code]
      @properties = Property.find(:all, :order => 'prioridad asc', :conditions => {:code => params[:code]})
    else  
      @properties = Property.where(:type_of_property => @type_of_property).where(:country => @country).where(:location => @location).where(:type_of_operation => @type_of_operation).where(:state => 'Publicada').order('prioridad asc')
    end

  end
  
  def show
    @property = Property.find(params[:id])
    @covered = @property.covered_square_meters
    @uncovered = @property.uncovered_square_meters
    unless @property.ambientes.nil? 
      @ambientes = @property.ambientes.split(/\r\n/) 
    end
    unless @property.amenities.nil?
      @amenities = @property.amenities.split(/\r\n/) 
    end
    @message = Message.new
  end

 def create
    @message = Message.new(params[:message])
    
    if @message.valid?
      NotificationsMailer.new_message_property(@message).deliver
      redirect_to(properties_path(@property), :notice => "Mensaje enviado correctamente.")
    else
      flash.now.alert = "Por favor, rellene todos los campos."
      render :new
    end
  end

end
