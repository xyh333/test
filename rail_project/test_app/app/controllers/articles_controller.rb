class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def new
    @article = Article.new
  end

  def index
    @article = Article.paginate(page: params[:page], per_page: 2)
    #@article = Article.all
  end

  def create 
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:success] = "Article saved."
      redirect_to articles_path(@article)
    else
      render 'new'
    end
  end

  def show

  end

  def edit

  end

  def update
    if @article.update(article_params)
      flash[:success] = "Article updated"
      redirect_to articles_path(@article)
    else
      render 'edit'
    end
  end


  def destroy 
    @article.destroy
    flash[:danger] = "Article deleted"
    redirect_to articles_path
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end
    def article_params
      params.require(:article).permit(:title, :description)
    end

    def require_same_user
      if current_user != @article.user and !current_user.admin?
        flash[:danger] = "You can only edit or delete your own articles"
        redirect_to welcome_home_path
      end
    end
end

