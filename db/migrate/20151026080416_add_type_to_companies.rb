class AddTypeToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :companyType, :string, null: false, default: ""
  end
end
