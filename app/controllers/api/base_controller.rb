module Api
	class BaseController < ApplicationController
		protect_from_forgery with: :null_session
        prepend_before_action :authenticate
        respond_to :json

        protected

        def authenticate
          authenticate_token || (render_unauthorized and return)
          authenticate_activation || (render_unactivated and return)
        end

        def authenticate_token
          authenticate_with_http_token do |token, options|
            key = Apikey.find_by(access_token: token)
            puts "**************  Key: " + token
            if key
                @user = key.user
            else
                @user = nil
            end
          end
        end

        def authenticate_activation
            @user.activated?
        end

        def render_unauthorized
          # self.headers['WWW-Authenticate'] = 'Token realm="Application"'
          render json: {J_PARA[:err] =>  ERRORS[:INVALID_ACCESS_TOKEN]}, status: :unauthorized
        end

        def render_unactivated
            render json: {J_PARA[:info] =>  INFO[:SESSIONS_NOT_ACTIVATED]}, status: :forbidden
        end

        def render_incomplete
          render json: {J_PARA[:err] =>  ERRORS[:INCOMPLETE_DATA]}, status: :bad_request
        end
	end
end