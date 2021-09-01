class ApplicationController < ActionController::API
  private
  def unauthorized
  render json: {
    'errors': [
      {
        'status': '401',
        'title': 'Not Auhorized,log with the right user'
      }
    ]
  }, status: 401
  end
  
end

