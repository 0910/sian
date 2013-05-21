class Property < ActiveRecord::Base
  has_many :images, as: :viewable, order: :position, :dependent => :destroy
  belongs_to :neighborhood
  accepts_nested_attributes_for :images, allow_destroy: true
  attr_protected
  validates :neighborhood, presence: true
  validates :url_name, uniqueness: true
  validates :name, uniqueness: true
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  before_validation do
    return if self.name.blank?
    self.url_name = self.name.downcase.gsub(/[^a-z0-9]/,'-')
  end
end  
