class Commentaire < ActiveRecord::Base
  belongs_to :created_by, :class_name => "User", :foreign_key => 'user_id', :validate => true
  belongs_to :article
end
