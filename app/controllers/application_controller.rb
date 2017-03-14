class ApplicationController < ActionController::API
  before_action :authenticate_request  
  # authenticate every request via token
  def authenticate_request
    unless request.headers[:token] == "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE0NjA2NTgxODZ9"
      render json: { error: 'Not Authorized' }, status: 401
    end
  end
end
