class CreateCompanyRoles < ActiveRecord::Migration
  def change
    create_table :company_roles do |t|
      t.string  :role,       null: false, default: ""
      t.integer :company_id, null: false
      t.integer :person_id,  null: false

      t.timestamps null: false
    end
  end
end
