class Categorie < ActiveRecord::Base
	has_many :articles

    # methode toString()
    def to_s
        self.nom
    end
end
