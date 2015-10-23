class ClientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_clients, except: [:index, :new, :create]

  def index
    @companies = Company.all
    @count = 0
  end

  def show
  end

  def new
    @company=Company.new
    @button='新增'
  end

  def create
    @company=Company.new client_params
    if @company.save
      redirect_to clients_path, notice: "[新增] "+@company.nameFull+" is added."
    else
      render :new
    end
  end

  def edit
    @button='更新'
  end

  def update
    if @company.update(client_params)
      redirect_to clients_path, notice: "[更新] "+@company.nameFull+" is update."
    else
      render :edit
    end
  end

  def destroy
    @temp=@company.nameFull
    @company.destroy
    redirect_to clients_path, alert: "[刪除] "+@temp+" is delete."
  end

  private

  def client_params
    params.require(:client).permit(:nameFull, :nameShort, :companyCode, :level,
                                   :phone, :fax, :taxId, :email, :address, :remark)
  end

  def set_clients
    @company = Company.find(params[:id])
  end

end
