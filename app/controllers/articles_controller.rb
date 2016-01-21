class ArticlesController < ApplicationController

  def is_reading
    article = Article.find(params[:article_id])
    article.read = !article.read
    article.save
    redirect_to root_path
  end
  
end
