class User < ActiveRecord::Base
	
	has_many :appointments
	has_one :apikey, dependent: :destroy
	has_one :device, dependent: :destroy
	has_many :locations, dependent: :destroy

end
