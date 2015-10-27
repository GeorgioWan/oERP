class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string  :code,          null: false, default: ""
      t.string  :name,          null: false, default: ""
      t.string  :unit,          null: false, default: ""
      t.decimal :price,         null: false, default:  0
      t.decimal :bargain_price, null: false, default:  0
      t.date    :end_date
      t.integer :buffer_stock,  null: false, default:  0
      t.integer :stock,         null: false, default:  0
      t.decimal :cost,          null: false, default:  0
      t.text    :description,   null: false, default: ""
      t.text    :remark,        null: false, default: ""
      t.string  :image

      t.timestamps null: false
    end

    add_index :products, :code, unique: true
    add_index :products, :name, unique: true
  end
end
