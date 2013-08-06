class Newsletter < ActiveRecord::Base
	validates :name, presence: true
	attr_accessible :name, :email, :apellido
	validates :email, :format => { :with => %r{.+@.+\..+} }, :allow_blank => true
end  
