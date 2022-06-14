class ProgramContent < ActiveRecord::Base
  validates_presence_of :content
  belongs_to :program, :foreign_key => :id, :autosave=>true
  accepts_nested_attributes_for :program, :allow_destroy => true
end
