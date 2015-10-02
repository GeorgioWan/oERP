class Company < ActiveRecord::Base
  has_many :contacts_roles, ->{ where(:role => "Contact") }, :class_name => "CompanyRole"
  has_many :contacts, :through => :contacts_roles, :source => :person

  has_many :representative_roles, ->{ where(:role => "Representative") }, :class_name => "CompanyRole"
  has_many :representatives, :through => :representative_roles, :source => :person

	validates_uniqueness_of :companyCode
	validates_presence_of :companyCode, :nameShort
	validates_format_of :email,
		:with => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
end
