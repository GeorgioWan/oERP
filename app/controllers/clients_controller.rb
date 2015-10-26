class ClientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_clients, except: [:index, :new, :create]
  helper_method :edit_path, :show_path, :new_path

  def index
    @companies = Company.where(companyType: 'client')
    @count = 0
  end

  def show
  end

  def new
    @company          = Company.new
    @companyCode      = ' - Your company code'
    @companyType      = 'client'
    @taxId            = ' - Company tax id'
    @nameFull         = ' - Full name'
    @nameShort        = ' - Short name'
    @email            = ' - e.g. abc@gmail.com..'
    @phone            = ' - e.g. 0987654321..'
    @fax              = ' - e.g. 0234567..'
    @address          = ' - Company\'s address'
    @remark           = ' - Something about the company'
    @button           = '新增'
    @new_or_edit_path = clients_path
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
    @companyCode = @company.companyCode
    @companyType = 'client'
    @taxId       = @company.taxId
    @nameFull    = @company.nameFull
    @nameShort   = @company.nameShort
    @email       = @company.email
    @phone       = @company.phone
    @fax         = @company.fax
    @address     = @company.address
    @remark      = @company.remark
    @button      = '更新'
    @new_or_edit_path = client_path(params[:id])
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
    params.require(:company).permit(:nameFull, :nameShort, :companyCode, :level, :companyType,
                                    :phone, :fax, :taxId, :email, :address, :remark)
  end

  def set_clients
    @company = Company.find(params[:id])
  end

  def edit_path id
    edit_client_path(id)
  end

  def show_path id
    client_path(id)
  end

  def new_path
    new_client_path
  end

end
