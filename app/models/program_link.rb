class ProgramLink< ActiveRecord::Base
  validates_presence_of :program_id, :program_link_category_id
  validates :program_id, :numericality => { :only_integer => true }
  belongs_to :program_link_category
  belongs_to :program
end
