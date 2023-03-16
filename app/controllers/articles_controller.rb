class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    # we need to get the instance object we want to edit by getting the value in the params hash
  end

  def create
    @article = Article.new(article_params)
    @article.user = User.first
    if @article.save
      flash[:notice] = "Article was created successfully." #flash helper hash for displaying messages
      redirect_to @article # this line is a short cut to 'redirect_to article_path(@article)'
    else
      render 'new' #if the article instance variable value didn't get save, plase show 'new' form again
    end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was created successfully." 
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private 

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

end