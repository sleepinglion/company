class CreateProgramLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :program_links do |t|
      t.references :program_link_category, :null=>false
      t.references :program, :null=>false
      t.string :title, :limit=>60, :null=>false
      t.string :link, :limit=>200, :null=>false
      t.string :description, :limit=>200
      t.boolean :enable, :null=>false, :default=>true
      t.timestamps :null=>false
    end
  end
end
