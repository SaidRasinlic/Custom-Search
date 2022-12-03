class ArticlesController < ApplicationController
  before_action :current_user

  # def index
  #   @articles = Article.search(params[:query])
  # end

  def index
    @articles = if params[:search]
        Article.search(params[:search])
      else
        Article.all
      end
  end

  def search
    result = search_handler.search
    search_handler.save_activity
    return render_error(result[:error_code], result[:error_message]) if result[:error_code]

    render json: result, status: :ok
  end

  private

  def search_handler
    @search_handler ||= SearchHandler.new(permitted_params, @current_user)
  end

  def permitted_params
    params.permit(:article, :search, :user_id, :identifier)
  end
end
