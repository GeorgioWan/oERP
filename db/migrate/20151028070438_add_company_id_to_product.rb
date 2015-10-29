class AddCompanyIdToProduct < ActiveRecord::Migration
  def change
    add_column :products, :company_id, :integer
    add_index :products, :company_id
  end
end
