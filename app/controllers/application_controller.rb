class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  class TodoError < StandardError; end

  before_action :authenticate

  rescue_from TodoError do |exception|
    obj = { message: 'bad request' }
    render json: obj, status: :bad_request
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    obj = { message: 'not found' }
    render json: obj, status: :not_found
  end

  protected
  
  def authenticate
    authenticate_token || render_unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |token, options|
      # TODO: Auth API check
      token == 'FOO'
      @current_user_id = 2
    end
  end

  def render_unauthorized
    obj = { message: 'token invalid' }
    render json: obj, status: :unauthorized
  end
end
