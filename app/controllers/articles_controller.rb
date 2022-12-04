class ArticlesController < ApplicationController
  def index
    @articles = if params[:search]
        Article.search(params[:search])
      else
        Article.all
      end
  end
end
