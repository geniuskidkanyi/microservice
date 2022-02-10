class Api::BaseController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :authenticate_user!
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
  rescue_from ActionController::ParameterMissing, with: :bad_request

  def not_found
    render json: {
      'errors': [
        {
          'status': '404',
          'title': 'Not Found'
        }
      ]
    }, status: 404
  end

  def record_invalid(message)
  render json: {
    'errors': [
      {
        'status': '400',
        'title': message
      }
    ]
  }, status: 400
end

def bad_request(exception)
  render json: { title: exception.message }, status: :bad_request 
end

end
