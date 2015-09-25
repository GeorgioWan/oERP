class Company < ActiveRecord::Base
	has_many :people

	validates_uniqueness_of :companyCode
	validates_presence_of :companyCode, :nameShort
	validates_format_of :email, 
		:with => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
end
