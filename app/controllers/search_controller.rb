class SearchController < ApplicationController
  before_action :current_user

  def index; end

  def search
    result = search_handler.search
    search_handler.save_activity
    if result[:error_code]
      return render_error(result[:error_code], result[:error_message])
    else
      render json: result, status: :ok
    end
  end

  private

  def search_handler
    @search_service ||= SearchHandler.new(permitted_params, @current_user)
  end

  def permitted_params
    params.permit(:search, :user_id, :identifier)
  end
end
