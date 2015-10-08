class Company < ActiveRecord::Base
  has_one :contact_roles, ->{ where(:role => "Contact") }, :class_name => "CompanyRole"
  has_one :contacts, :through => :contact_roles, :source => :person

  has_one :representative_roles, ->{ where(:role => "Representative") }, :class_name => "CompanyRole"
  has_one :representatives, :through => :representative_roles, :source => :person

	validates_uniqueness_of :companyCode
	validates_presence_of :companyCode, :nameShort
	validates_format_of :email,
		:with => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
end
