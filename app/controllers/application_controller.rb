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
  def is_authorized_user
    if user_signed_in? && @article.user_id == current_user.id
      return true 
    else
      unauthorized
    end 
  end
end

