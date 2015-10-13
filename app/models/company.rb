class Company < ActiveRecord::Base
  has_one :contact_role, ->{ where(:role => "Contact") }, :class_name => "CompanyRole"
  has_one :contact, :through => :contact_role, :source => :person

  has_one :representative_role, ->{ where(:role => "Representative") }, :class_name => "CompanyRole"
  has_one :representative, :through => :representative_role, :source => :person

	validates_uniqueness_of :companyCode
	validates_presence_of :companyCode, :nameShort
	validates_format_of :email,
		:with => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
end