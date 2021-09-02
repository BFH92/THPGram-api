class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  
  private

  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?

    register_failed
  end

  def register_success
    jwt = request.headers['Authorization']
    render json: {jwt: jwt, message: "Login successful!"}

  end

  def register_failed
    render json: { message: "Something went wrong.failed to register" }
  end
end