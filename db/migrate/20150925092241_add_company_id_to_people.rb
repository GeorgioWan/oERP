class AddCompanyIdToPeople < ActiveRecord::Migration
  def change
    add_reference :people, :company, index: true
    add_foreign_key :people, :companies
  end
end
