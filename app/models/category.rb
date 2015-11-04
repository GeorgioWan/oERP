class Category < ActiveRecord::Base
  ###### Association ######
  has_many :products

  ###### Validate ######
  validates_presence_of   :title
  validates_uniqueness_of :title
end
