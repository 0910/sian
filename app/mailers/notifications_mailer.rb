class NotificationsMailer < ActionMailer::Base
  default :from => "info@siangroup.net"
  default :to => "info@siangroup.net"

  def new_message(message)
    @message = message
    mail(:subject => "Mensaje de contacto del sitio siangroup.net")
  end

  def new_message_property(message)
    @message = message
    mail(:subject => "Consulta por una propiedad del sitio siangroup.net")
  end

end
