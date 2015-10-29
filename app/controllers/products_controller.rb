class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, except: [:index, :new, :create]
  before_action :set_variable,  only:   [:new, :create,   :edit, :update]

  def index
    @products = Product.all
    @count = 0
  end

  def show
  end

  def new
    @product=Product.new
  end

  def create
    @product=Product.new product_params
    if @product.save
      redirect_to products_path, notice: "[新增] "+@product.name+" is added."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to products_path, notice: "[更新] "+@product.name+" is update."
    else
      render :edit
    end
  end

  def destroy
    @temp=@product.name
    @product.destroy
    redirect_to products_path, alert: "[刪除] "+@temp+" is delete."
  end

  private

  def product_params
    params.require(:product).permit( :code,  :name, :unit,  :price, :bargain_price, :end_date, :company_id,
                                     :buffer_stock, :stock, :cost,  :description,   :remark, :image)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def set_variable
    if @product.nil?
      @code             = ' - Product\'s code'
      @name             = ' - Product\'s name'
      @unit             = ' - e.g. 個、組、件...'
      @image            = ' - upload image'
      @price            = ' - Normal price'
      @bargainPrice     = ' - On sale price'
      @bufferStock      = ' - 安全存量'
      @endDate          = ' - sale out date'
      @description      = ' - Something about the product'
      @remark           = ' - Note for product'
      @button           = '新增'
      @companies = Company.where(companyType: 'supplier')
    else
      @code             = @product.code
      @name             = @product.name
      @unit             = @product.unit
      @image            = @product.image
      @price            = @product.price
      @bargainPrice     = @product.bargain_price
      @bufferStock      = @product.buffer_stock
      @endDate          = @product.end_date
      @description      = @product.description
      @remark           = @product.remark
      @button           = '更新'
      @companies = Company.where(companyType: 'supplier')
    end
  end
end
