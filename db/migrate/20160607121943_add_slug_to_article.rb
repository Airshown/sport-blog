class AddSlugToArticle < ActiveRecord::Migration
  def change
  	add_column :articles, :slug, :string, unique: true, index: true
  end
end
