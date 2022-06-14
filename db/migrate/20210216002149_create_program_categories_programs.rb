class CreateProgramCategoriesPrograms < ActiveRecord::Migration[6.0]
  def change
    create_table :program_categories_programs do |t|
      t.references :program_category,:null=>false
      t.references :program,:null=>false
      t.boolean :enable, :null=>false, :default=>true
      t.timestamps :null=>false
    end
  end
end
