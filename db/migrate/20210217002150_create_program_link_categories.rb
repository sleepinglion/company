class CreateProgramLinkCategories < ActiveRecord::Migration[4.2]
  def change
    create_table :program_link_categories do |t|
      t.string :title, :limit=>60, :null=>false
      t.integer :program_links_count, :null=>false, :default=>0
      t.boolean :enable, :null=>false, :default=>true
      t.timestamps :null=>false
    end
  end
end
