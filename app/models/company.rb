class Company < ActiveRecord::Base
  ###### Association ######
  has_many  :contact_role, ->{ where(:role => "Contact") }, :class_name => "CompanyRole"
  has_many  :contact, :through => :contact_role, :source => :person

  has_many  :representative_role, ->{ where(:role => "Representative") }, :class_name => "CompanyRole"
  has_many  :representative, :through => :representative_role, :source => :person

  has_many :products, dependent: :destroy

  ###### Validate ######
	validates_uniqueness_of   :companyCode, :nameFull,  :nameShort
	validates_presence_of     :companyCode, :nameShort, :nameFull
	validates_format_of       :email,
		                        :with => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i

  ###### Friendly ID ######
  extend FriendlyId
  friendly_id :nameFull, use: :slugged

  def normalize_friendly_id(input)
    "#{companyCode}-#{input.to_s.to_slug.normalize.to_s}"
  end
end
