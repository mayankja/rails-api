class UsersController < ApplicationController
  # Filters
  
  before_action :set_user, only: [:show, :update, :destroy]
  skip_before_action :authenticate_request, only: [:reset_password,:forgot_password]
  
  # GET /users
  # this for the user listing
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  # this for the user show
  def show
    render json: @user
  end

  # POST /users
  # this for the user create
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  # this for the user update
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  # this for the user destroy
  def destroy
    @user.destroy
  end

  # this for the forgot_password of the user
  def forgot_password
    @user = User.find_by(email: user_params[:email])
    if @user
      @user.forgot_password_with_email
      render json: { message: "Please check your email. An otp has been sent to it.", status: 200}
    else
      render json: { errors: "Invalid user email" }
    end
  end

  # this for the reset_password of the user
  def reset_password
    @user = User.find_by(email: user_params[:email], reset_password_token: user_params[:old_password])
    if @user && @user.update(user_params)
      @user.update_columns(reset_password_token: "")
      render json: { message: "Your password has been reset successfully.", status: 200 }
    else
      render json: { errors: "Invalid user email and old password" }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:user_id, :first_name, :last_name, :email, :email_notifications_opt, :cell_phone, :sms_notifications_opt, :password, :password_confirmation, :enabled, :old_password)
    end
end
