class Apikey < ActiveRecord::Base
  before_validation :generate_token, on: :create
  belongs_to :user
  

  validates :access_token, presence: true, uniqueness: true
  validates_associated :user

  private

  	def generate_token
  		begin
      		self.access_token = SecureRandom.hex
    	end while self.class.exists?(access_token: access_token)
  	end
end
