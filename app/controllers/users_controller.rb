class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, except: [:index, :new, :create]
  before_action :set_variable, only: [:new, :create, :edit, :update]

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
    @button='新增'
  end

  def create
    @user=User.new user_params
    if @user.save
      redirect_to users_path, notice: "[新增] "+@user.username+" is added."
    else
      render :new
    end
  end

  def edit
    @button='更新'
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: "[更新] "+@user.username+" is update."
    else
      render :edit
    end
  end

  def destroy
    @temp=@user.username
    @user.destroy
    redirect_to users_path, alert: "[刪除] "+@temp+" is delete."
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :phone, :sex, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_variable
    if @user.nil?
      @username  = ' - Full Name'
      @email     = ' - e.g. abc@gmail.com..'
      @phone     = ' - e.g. 0987654321..'
      @button    = '新增'
    else
      @username  = @user.username
      @email     = @user.email
      @phone     = @user.phone
      @button    = '更新'
    end
  end

end
