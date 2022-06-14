class Contact < ActiveRecord::Base
  validates_presence_of :title
  validates :contact_content, :presence => true
  has_one :contact_content, :foreign_key => :id, :dependent=>:destroy
  accepts_nested_attributes_for :contact_content, :allow_destroy => true
  delegate :content, :to => :contact_content, :prefix => true
end
