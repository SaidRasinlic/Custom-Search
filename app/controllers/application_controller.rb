class ApplicationController < ActionController::Base
  before_action :turbo_frame_request_variant

  protected

  def current_user
    @current_user ||= request.remote_ip.to_s.gsub(/[^0-9A-Za-z]/, "").to_i
  end

  def render_error(error_code, error_message)
    render json: { data: [], errors: error_message }, status: error_code
  end

  private

  def turbo_frame_request_variant
    request.variant = :turbo_frame if turbo_frame_request?
  end
end
