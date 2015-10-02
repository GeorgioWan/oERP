class CompanyRole < ActiveRecord::Base
	belongs_to :company
  belongs_to :person
end
