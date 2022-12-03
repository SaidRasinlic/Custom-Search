class ApplicationController < ActionController::Base
  protected

  def current_user
    @current_user ||= request.remote_ip.to_s.gsub(/[^0-9A-Za-z]/, '').to_i
  end

  def render_error(error_code, error_message)
    render json: { data: [], errors: error_message }, status: error_code
  end
end
