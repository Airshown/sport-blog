class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :is_admin, except: [:show]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.includes(:categorie).paginate(page: params[:page], per_page: 10)
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @categories = Categorie.all
    
    @idArticle = Article.where(slug: params[:id])
    @comments = Commentaire.where(article_id: @idArticle)
    
    @commentaire = Commentaire.new(commentaire_params)
    @commentaire.created_by = current_user
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    @article.created_by = current_user

    respond_to do |format|
      if @article.save
        format.html { redirect_to articles_path, notice: 'Succès : Article enregistré.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      @article.created_by = current_user
      if @article.update(article_params)
        format.html { redirect_to articles_path, notice: 'Succès : Article enregistré.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Succès : L\'article a bien été supprimé.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end
    
    def is_admin
      if !user_signed_in?
         render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false)
      else
        if !current_user.has_role?(:admin, current_user)
           render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false)
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:titre, :contenu, :categorie_id, :masquer, :photo,:created_by)
    end
    
    def commentaire_params
      params.permit(:contenu, :user_id, :article_id)
    end
end
