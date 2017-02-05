class StaffDivision < ActiveRecord::Base
	belongs_to :staff
	belongs_to :division
end
