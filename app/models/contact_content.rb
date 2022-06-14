class ContactContent < ActiveRecord::Base
  validates_presence_of :content
  belongs_to :contact, :autosave=>true, :foreign_key => :id
end
