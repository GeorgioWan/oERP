class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, except: [:index, :new, :create]

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

  def new
    @user=User.new
    @button='Add'
  end

  def create
    @user=User.new user_params
    if @user.save
      redirect_to users_path, notice: "[NEW] "+@user.username+" is added."
    else
      render :new
    end
  end

  def edit
    @button='Update'
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: "[EDIT] "+@user.username+" is update."
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :phone, :sex, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
