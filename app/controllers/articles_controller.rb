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
    @article = Article.find(params[:id])
  end
  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    @article.user = User.first
    if @article.save
      flash[:notice] ="Article created successfully"
      redirect_to @article
    else
      puts @article.errors.full_messages
      render :new
    end
  end
  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article updated successfully"
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Article deleted successfully"
    redirect_to articles_path
  end

end
