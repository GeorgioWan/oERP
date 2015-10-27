class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, except: [:index, :new, :create]

  def index
    @products = Product.all
    @count = 0
  end

  def show
  end

  def new
    @product=Product.new
    @button='新增'
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
    @button='更新'
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
    params.require(:product).permit( :code,  :name, :unit,  :price, :bargain_price, :end_date,
                                     :buffer_stock, :stock, :cost,  :description,   :remark, :image)
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
