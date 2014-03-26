class Document < ActiveRecord::Base
  attr_accessible :file, :position
  has_attached_file :file
  validates_attachment :file, presence: true,
    content_type: { content_type: ['application/pdf'] }
  belongs_to :viewable, :polymorphic => true
end
