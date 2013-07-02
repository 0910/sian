class NotificationsMailer < ActionMailer::Base
  default :from => "info@siangroup.net"
  default :to => "info@siangroup.net"

  def new_message(message)
    @message = message
    mail(:subject => "Mensaje del sitio siangroup.net")
  end
end
