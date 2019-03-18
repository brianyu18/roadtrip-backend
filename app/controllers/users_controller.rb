
class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create, :login]

  # GET /users

  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: current_user()
  end

  # POST /users
  def create
    @user = User.create(user_params)
    if @user.valid?
      secret = 'noodle'
      userTokenData = {user_id: @user.id}
      userToken = encode_token(userTokenData)
      render json: { token: userToken, user_id: @user.id, username: @user.username }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end
  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  #custom routes
  #POST/login
  def login
    @user = User.where("username = ? AND password = ?", params[:username], params[:password]).first
    if @user
      secret = 'noodle'
      userTokenData = {user_id: @user.id}
      userToken = encode_token(userTokenData)
      render json: { result: "success", token: userToken, user_id: @user.id, username: @user.username }, status: :ok
    else
      render json: { result: "failed", message: 'failed to login' }, status: :unauthorized
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:username, :password, :firstname, :lastname, :email)
    end
end
