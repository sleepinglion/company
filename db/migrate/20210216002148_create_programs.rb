class CreatePrograms < ActiveRecord::Migration[4.2]
  def change
    create_table :programs do |t|
      t.string :title, :limit=>60, :null=>false
      t.string :description, :limit=>200
      t.string :service_link, :limit=>200
      t.boolean :use_database, :null=>false, :default=>true
      t.integer :program_categories_programs_count, :null=>false, :default=>0      
      t.boolean :enable, :null=>false, :default=>true
      t.timestamps :null=>false
    end

    create_table :program_contents do |t|
      t.text :content,:null=>false
    end
  end
end
