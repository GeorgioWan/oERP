class CreateCompanyRoles < ActiveRecord::Migration
  def change
    create_table :company_roles do |t|
      t.integer :company_id
      t.integer :person_id

      t.timestamps null: false
    end
  end
end
