class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, except: :index

  def index
    @users = User.all
    @count = 0
  end

  def show
    if @user.sex == 1
      @sex = 'Male'
    elsif @user.sex == 2
      @sex = 'Female'
    else
      @sex = 'N'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end
