class ApisessionsController < Devise::SessionsController
  # protect_from_forgery prepend: true
  skip_before_action :verify_authenticity_token
  protect_from_forgery with: :null_session
  respond_to :json


  def create
    # binding.pry
      super { |resource| @resource = resource }

  end


  private

  def respond_with(resource, _opts = {})
    # binding.pry
    # render_jsonapi_response(resource)
    if resource.errors.empty?
      render json: {status: "SUCCESS", data: resource }, status: :ok
    else
      render json: {status: "ERROR", data: resource.errors}, status: :error
    end
  end

  def respond_to_on_destroy
    head :no_content
  end

end
