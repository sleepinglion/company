class ProgramLinkCategory < ActiveRecord::Base
  validates_length_of :title, :maximum => 60
  has_many :program_links
end
