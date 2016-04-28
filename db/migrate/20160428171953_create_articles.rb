class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :titre
      t.text :contenu
      t.references :categorie, index: true, foreign_key: true
      t.timestamp :createdAt
      t.timestamp :updatedAt
      t.boolean :masquer

      t.timestamps null: false
    end
  end
end
