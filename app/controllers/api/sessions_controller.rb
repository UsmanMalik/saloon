module Api
  class SessionsController < Api::BaseController
    skip_before_action :authenticate, only: [:create]
    skip_before_filter  :verify_authenticity_token

    include Api::SessionsHelper

    def create
      @user = User.find_by(email: params[:email].downcase, password: params[:password])
      if @user # need to set password
        if @user # need a check of activated etc..
          log_in_user
          user_detail = {}
          user_detail[:user] = @user
          user_detail[:api_key] = @user.apikey.access_token

          render json: user_detail, status: :ok
        else
          render_unactivated
        end
      else
        render json: {issue: :failur}, status: :unauthorized
      end
    end

    def destroy
      log_out_user
      if logged_out_user?
        render json: {J_PARA[:info] => INFO[:OK]}, status: :ok
      else
        render json: {J_PARA[:info] => INFO[:UNKNOWN_ERR]}, status: :internal_server_error
      end
    end

  end
end