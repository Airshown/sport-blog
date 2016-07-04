json.array!(@commentaires) do |commentaire|
  json.extract! commentaire, :id, :contenu, :user_id, :article_id
  json.url commentaire_url(commentaire, format: :json)
end
