class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    # we need to get the instance object we want to edit by getting the value in the params hash
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save
      flash[:notice] = "Article was created successfully." #flash helper hash for displaying messages
      redirect_to @article # this line is a short cut to 'redirect_to article_path(@article)'
    else
      render 'new' #if the article instance variable value didn't get save, plase show 'new' form again
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article was created successfully." 
      redirect_to @article
    else
      render 'edit'
    end
  end

end