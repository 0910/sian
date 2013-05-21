class PagesController < ApplicationController
  def home
    @properties = Property.order('created_at desc').all
  end
  

  
  def terms_of_service
  end
  
  def privacy_policy
  end

  def contact_us
  end
end
