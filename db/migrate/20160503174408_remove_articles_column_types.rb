class RemoveArticlesColumnTypes < ActiveRecord::Migration
  def change
  	remove_column :articles, :createdAt
  	remove_column :articles, :updatedAt
  end
end
