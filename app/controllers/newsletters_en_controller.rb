class NewslettersEnController < ActionController::Base
	def create
		@newsletter = Newsletter.new(params[:newsletter])
    if @newsletter.valid?
      @newsletter.save
      redirect_to(root_path, :notice => "Sign up Successfully.")
    else
      flash.now.alert = "Please fill in all fields."
      render :new
    end
	
	end
end
