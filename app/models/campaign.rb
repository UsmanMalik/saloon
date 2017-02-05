class Campaign < ActiveRecord::Base
	has_many :ads

	# validates_acceptance_of :privacy_policy, :terms_of_service
	validates_length_of :title, within: 5..20
	validates_uniqueness_of :title, message: "%{value} is already registered"
	validates_presence_of :start_date
	validates_presence_of :end_date
	validate :start_date_before_end_date


    private
  
	  def start_date_before_end_date
	  	if self.start_date.present? && self.end_date.present?
		    if self.start_date > self.end_date
		      errors.add(:start_date, "Start date should be before end date")
		    end
		end
	  end
end
