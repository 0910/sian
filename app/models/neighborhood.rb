class Neighborhood < ActiveRecord::Base
  has_many :images, as: :viewable, order: :position, :dependent => :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  attr_protected
  has_many :properties
  validates :url_name, uniqueness: true
  validates :name, uniqueness: true

  before_validation do
    return if self.name.blank?
    self.url_name = self.name.downcase.gsub(/[^a-z0-9]/,'-')
  end
end  
