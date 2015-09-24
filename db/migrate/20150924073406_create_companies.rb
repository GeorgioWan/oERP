class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|

      t.string :companyCode,  null: false, default: ""
      t.string :nameFull,     null: false, default: ""
      t.string :nameShort,    null: false, default: ""
      t.string :level,        null: false, default: ""

      t.string :phone,        null: false, default: ""
      t.string :fax,          null: false, default: ""
      t.string :taxId,        null: false, default: ""

      t.string :email,        null: false, default: ""
      t.string :address,      null: false, default: ""
      t.text   :remark,       null: false, default: ""

      t.timestamps null: false
    end

    add_index :companies, :companyCode, unique: true
  end
end
