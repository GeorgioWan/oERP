class PeopleController < ApplicationController
  before_action :authenticate_user!
  before_action :set_person, except: [:index, :new, :create]
  before_action :set_variable, only: [:new, :create, :edit, :update]

  def index
    @people = Person.all
    @count = 0
  end

  def show
  end

  def new
    @person=Person.new
  end

  def create
    @person=Person.new person_params
    if @person.save
      redirect_to people_path, notice: "[新增] "+@person.nameFull+" is added."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @person.update(person_params)
      redirect_to people_path, notice: "[更新] "+@person.nameFull+" is update."
    else
      render :edit
    end
  end

  def destroy
    @temp=@person.nameFull
    @person.destroy
    redirect_to people_path, alert: "[刪除] "+@temp+" is delete."
  end

  private

  def person_params
    params.require(:person).permit(:nameFull, :nameShort, :email, :phone)
  end

  def set_person
    @person = Person.find(params[:id])
  end

  def set_variable
    if @person.nil?
      @nameFull  = ' - Full Name'
      @nameShort = ' - Nicknmae'
      @email     = ' - e.g. abc@gmail.com..'
      @phone     = ' - e.g. 0987654321..'
      @button    = '新增'
    else
      @nameFull  = @person.nameFull
      @nameShort = @person.nameShort
      @email     = @person.email
      @phone     = @person.phone
      @button    = '更新'
    end
  end

end
