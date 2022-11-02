class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]   # DRY - this helper defines 'set_article' symbol for every action in the array

  
  def show 
  end

  def index
    @articles = Article.all 
  end

  def new
      @article = Article.new
  end

  def edit
  end 

  def create
    #render plain: params[:article]
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was created successfully"
      redirect_to @article #this is the same as redirect_to article_path(@article)
    else 
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was created successfully"
      redirect_to @article
    else   
      render 'edit'
    end 
  end

  def destroy
    @article.destroy
    redirect_to articles_path #this is a build in route
  end

  private
  # anything below the ^^ 'private' reserve word is private
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end 

end