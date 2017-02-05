module Api
	module SessionsHelper

		def log_in_user(user: @user)
			# creates api key if doesn't exist already
			user.create_apikey unless user.apikey
		end

		def log_out_user(user: @user)
			# destroy api key if exists
			user.apikey.destroy if user.apikey
		end

		def logged_out_user?(user: @user)
			user.apikey.destroyed?
		end
	end
end