class Product < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :company

  def normalize_friendly_id(input)
    "#{code}-#{input.to_s.to_slug.normalize.to_s}"
  end

  validates_uniqueness_of   :code, :name
  validates_presence_of     :code, :name, :unit
  validates_numericality_of :price, :bargain_price, :buffer_stock, :stock, :cost
end
