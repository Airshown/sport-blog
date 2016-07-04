class HomeController < ApplicationController
	def index
		@articles = Article.includes(:categorie).paginate(page: params[:page], per_page: 4)
	end
end
