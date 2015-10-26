class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string  :nameFull,  	null: false, default: ""
      t.string :nameShort,    null: false, default: ""
      t.string     :phone,  	null: false, default: ""
      t.string     :email,  	null: false, default: ""

      t.timestamps null: false
    end
  end
end
