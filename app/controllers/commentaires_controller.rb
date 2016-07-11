class CommentairesController < ApplicationController
  before_action :set_commentaire, only: [:show, :edit, :update, :destroy]
  before_action :is_admin, except: [:add]

  # GET /commentaires
  # GET /commentaires.json
  def index
    @commentaires = Commentaire.paginate(page: params[:page], per_page: 5)
  end

  # GET /commentaires/1
  # GET /commentaires/1.json
  def show
  end

  # GET /commentaires/new
  def new
    @commentaire = Commentaire.new
  end

  # GET /commentaires/1/edit
  def edit
  end

  # POST /commentaires
  # POST /commentaires.json
  def create
    @commentaire = Commentaire.new(commentaire_params)
    @commentaire.created_by = current_user

    respond_to do |format|
      if @commentaire.save
        format.html { redirect_to commentaires_path, notice: t('commentaire_flash_save') }
        format.json { render :show, status: :created, location: @commentaire }
      else
        format.html { render :new }
        format.json { render json: @commentaire.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # POST /commentaires/add
  def add
    @commentaire = Commentaire.new(commentaire_params)
    @commentaire.created_by = current_user

    respond_to do |format|
      if @commentaire.save
        format.html { redirect_to :back, notice: t('commentaire_flash_save') }
        format.json { render :show, status: :created, location: @commentaire }
      else
        format.html { render :new }
        format.json { render json: @commentaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /commentaires/1
  # PATCH/PUT /commentaires/1.json
  def update
    respond_to do |format|
      @commentaire.created_by = current_user

      if @commentaire.update(commentaire_params)
        format.html { redirect_to commentaires_path, notice: t('commentaire_flash_save') }
        format.json { render :show, status: :ok, location: @commentaire }
      else
        format.html { render :edit }
        format.json { render json: @commentaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /commentaires/1
  # DELETE /commentaires/1.json
  def destroy
    @commentaire.destroy
    respond_to do |format|
      format.html { redirect_to commentaires_url, notice: t('commentaire_flash_destroy') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_commentaire
      @commentaire = Commentaire.find(params[:id])
    end

    def is_admin
      if !user_signed_in?
         render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false)
      else
        # ability = Ability.new(current_user)
        # if !ability.can? :manage, :all
        if !current_user.has_role?(:admin, current_user)
           render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false)
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def commentaire_params
      params.require(:commentaire).permit(:contenu, :user_id, :article_id)
    end
end
