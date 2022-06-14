class CreateProgramCategories < ActiveRecord::Migration[4.2]
  def change
    create_table :program_categories do |t|
      t.references :program_language,:null=>false
      t.string :title, :limit=>60, :null=>false
      t.string :link, :limit=>200
      t.integer :program_categories_programs_count, :null=>false, :default=>0
      t.boolean :main, :null=>false, :default=>true
      t.boolean :enable, :null=>false, :default=>true
      t.timestamps :null=>false
    end
  end
end
