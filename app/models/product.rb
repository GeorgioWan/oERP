class Product < ActiveRecord::Base
  ###### Association ######
  belongs_to :company
  belongs_to :category

  ###### Validate ######
  validates_uniqueness_of   :code, :name
  validates_presence_of     :code, :name, :unit
  validates_numericality_of :price, :bargain_price, :buffer_stock, :stock, :cost

  ###### Friendly ID ######
  extend FriendlyId
  friendly_id :name, use: :slugged

  def normalize_friendly_id(input)
    "#{code}-#{input.to_s.to_slug.normalize.to_s}"
  end

  ###### Carrierwave ######
  mount_uploader :image, ProductImgUploader

end
