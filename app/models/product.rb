class Product < ActiveRecord::Base
  belongs_to :company

  validates_uniqueness_of   :code, :name
  validates_presence_of     :code, :name, :unit
  validates_numericality_of :price, :bargain_price, :buffer_stock, :stock, :cost
end
