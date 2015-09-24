class Person < ActiveRecord::Base

	validates_presence_of :nameShort
	validates_format_of :email, 
		:with => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
end
