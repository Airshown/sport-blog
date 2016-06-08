class AddSlugToCategorie < ActiveRecord::Migration
  def change
  	add_column :categories, :slug, :string, unique: true, index: true
  end
end
