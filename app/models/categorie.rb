class Categorie < ActiveRecord::Base
	extend FriendlyId
      include SearchCop

	has_many :articles
    friendly_id :slug_candidates, use: [:slugged, :finders]

    # methode toString()
    def to_s
        self.nom
    end

    #On définit le ou les champs avec lequel le slug doit être créé
  def slug_candidates
  	[ :nom, [:id, :nom] ]
  end

  def should_generate_new_friendly_id?
  	nom_changed? || super
  end

  search_scope :search do
    attributes :nom
  end

    #search_scope :search

end
