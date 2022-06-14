class ProgramLanguage < ActiveRecord::Base
  validates_presence_of :title
  validates_length_of :title, :maximum => 60
  has_many :program_categories
end
