class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all

    render json: @users, status: 200
  end

  def show
    @user = User.find(params[:id])

    render json: @user, status: 200
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: 200
    else
      render json: { message: 'There was a problem creating your username, try not to use curse words, you pottymouth'}
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: @user, status: 200
    else
      render json: { message: 'There was a problem updating your username, try not to use curse words, you pottymouth'}
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user
      @user.destroy
      render json: {userId: @user.id}
    else
      render json: { message: 'There was an issue.'}
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
  
end