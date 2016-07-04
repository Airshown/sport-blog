class CreateCommentaires < ActiveRecord::Migration
  def change
    create_table :commentaires do |t|
      t.text :contenu
      t.references :user, index: true, foreign_key: true
      t.references :article, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
