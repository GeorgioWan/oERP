class SuppliersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_suppliers, except: [:index,  :new, :create]
  before_action :set_variable,  only:   [:new, :create,   :edit, :update]
  helper_method :edit_path, :show_path, :new_path

  def index
    @companies = Company.where(companyType: 'supplier')
    @count = 0
  end

  def show
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new supplier_params
    if @company.save
      redirect_to suppliers_path, notice: "[新增] "+@company.nameFull+" is added."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @company.update(supplier_params)
      redirect_to suppliers_path, notice: "[更新] "+@company.nameFull+" is update."
    else
      render :edit
    end
  end

  def destroy
    @temp=@company.nameFull
    @company.destroy
    redirect_to suppliers_path, alert: "[刪除] "+@temp+" is delete."
  end

  private

  def supplier_params
    params.require(:company).permit(:nameFull, :nameShort, :companyCode, :level, :companyType,
                                    :phone, :fax, :taxId, :email, :address, :remark,
                                    :contact_ids, :representative_ids)
  end

  def set_suppliers
    @company = Company.find(params[:id])
  end

  def edit_path id
    edit_supplier_path(id)
  end

  def show_path id
    supplier_path(id)
  end

  def new_path
    new_supplier_path
  end

  def set_variable
    if @company.nil?
      @companyCode      = ' - Your company code'
      @companyType      = 'supplier'
      @taxId            = ' - Company tax id'
      @nameFull         = ' - Full name'
      @nameShort        = ' - Short name'
      @email            = ' - e.g. abc@gmail.com..'
      @phone            = ' - e.g. 0987654321..'
      @fax              = ' - e.g. 0234567..'
      @address          = ' - Company\'s address'
      @remark           = ' - Something about the company'
      @button           = '新增'
      @new_or_edit_path = suppliers_path
    else
      @companyCode      = @company.companyCode
      @companyType      = 'supplier'
      @taxId            = @company.taxId
      @nameFull         = @company.nameFull
      @nameShort        = @company.nameShort
      @email            = @company.email
      @phone            = @company.phone
      @fax              = @company.fax
      @address          = @company.address
      @remark           = @company.remark
      @button           = '更新'
      @new_or_edit_path = supplier_path(params[:id])
    end
  end
end
