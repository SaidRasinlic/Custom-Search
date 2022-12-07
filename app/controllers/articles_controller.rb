class ArticlesController < ApplicationController
  before_action :current_user

  def index
    @articles = Article.all
  end

  def show
    @results = Article.all
    if @results.blank?
      { error_message: ["We were not able to find any results for search '#{params[:search]}'"], error_code: 404 }
    else
      render json: { data: @results, errors: [] }
    end
  end
end

#   def index
#     if params[:search].present?
#       @articles = Article.where("title LIKE ?", "#{params[:search]}")
#     else
#       @articles = Article.all
#     end
#   end
# end

#   @articles = if params[:search]
#       Article.search(params[:search])
#     else
#       Article.all
#     end
# end
