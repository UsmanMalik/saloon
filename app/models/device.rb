class Device < ActiveRecord::Base
	belongs_to :user
	validates :key, presence: true
end
