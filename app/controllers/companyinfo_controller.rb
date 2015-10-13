class CompanyinfoController < ApplicationController
  before_action :authenticate_user!

  def new
    @company=Company.new
  end

  def create
    @company=Company(company_params)

    if @company.save
      redirect_to home_path
    else
      render :new
    end
  end

  def edit
    @company=Company.find(params[:id])
  end

  def update
    @company=Company.find(params[:id])

    if @company.update(company_params)
      redirect_to home_path, notice: "Company information is update."
    else
      render :edit
    end
  end


  private

  def company_params
    params.require(:company).permit(:nameFull, :nameShort, :companyCode, :level,
                                    :phone, :fax, :taxId, :email, :address, :remark)
  end
end
