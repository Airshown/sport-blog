json.array!(@articles) do |article|
  json.extract! article, :id, :titre, :contenu, :categorie_id, :createdAt, :updatedAt, :masquer
  json.url article_url(article, format: :json)
end
