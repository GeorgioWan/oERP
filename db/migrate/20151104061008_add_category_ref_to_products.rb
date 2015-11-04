class AddCategoryRefToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :category, index: true
    add_foreign_key :products, :categories
  end
end
