class Propose < ActiveRecord::Base
  validates_presence_of :title
  belongs_to :user,:autosave=>true
end
