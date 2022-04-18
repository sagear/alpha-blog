class ArticlesController < ApplicationController
  
  before_action :set_articles, only: [:show, :edit, :update, :destroy]
  def index
    @articles = Article.paginate(page: params[:page], per_page: 3)
  end

  def show
    
  end
  
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(articles_params)
    @article.user = User.first
    if @article.save
      flash[:notice] = "Article was successfully saved"     
      redirect_to @article
    else
      render 'new'
    end
  end

  def edit
  
  end

  def update
    
    if  @article.update(articles_params)
      flash[:notice] = "Article was updated"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article
    @article.destroy
    flash[:notice] = "Article was deleted"
    redirect_to articles_path
  end

  private

  def set_articles
    @article = Article.find(params[:id])
  end

  def articles_params
    params.require(:article).permit(:title, :description)
  end
end