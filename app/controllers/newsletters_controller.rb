class NewslettersController < ActionController::Base
	def create
		@newsletter = Newsletter.new(params[:newsletter])
    if @newsletter.valid?
      @newsletter.save
      redirect_to(root_path, :notice => "Te registraste correctamente.")
    else
      flash.now.alert = "Por favor, rellene todos los campos."
      render :new
    end
	
	end
end
