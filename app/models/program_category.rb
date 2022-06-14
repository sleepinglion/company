class ProgramCategory < ActiveRecord::Base
  validates_presence_of :title
  validates_length_of :title, :maximum => 60
  belongs_to :program_language, :counter_cache => true
  has_many :program_categories_programs
  has_many :programs, :through => :program_categories_programs
end
