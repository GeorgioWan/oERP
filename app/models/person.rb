class Person < ActiveRecord::Base
	has_many :contact_roles, ->{ where(:role => "Contact") }, :class_name => "CompanyRole"
  has_many :contact_companies, :through => :contact_roles, :source => :company

  has_many :representative_roles, ->{ where(:role => "Representative") }, :class_name => "CompanyRole"
  has_many :representative_companies, :through => :representative_roles, :source => :company

	validates_presence_of :nameFull, :nameShort
	validates_format_of   :email,
		                    :with => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
end
