class ArticlesController < ApplicationController
  #   def index
  #     if params[:search].present?
  #       @articles = Article.where("title LIKE ?", "%#{params[:search]}%")
  #     else
  #       @articles = Article.all
  #     end
  #   end
  # end

  def index
    if params[:search].present?
      @articles = Article.where("title LIKE ?", "%#{params[:search]}%")
    else
      @articles = Article.all
    end

    if turbo_frame_request?
      render partial: "articles", locals: { articles: @articles }
    else
      render :index
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
