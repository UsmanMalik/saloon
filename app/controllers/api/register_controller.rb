module Api
  class RegisterController < Api::BaseController
    
    skip_before_action :authenticate, only: [:create,:register_device]
    skip_before_filter  :verify_authenticity_token

    before_action :verify_params_user, only: [:create]
    before_action :verify_params_device, only: [:register_device]


    def create
      user = User.create(first_name: params[:first_name],  email: params[:email], password: params[:password])
      
      if user
        render json: {result: :success, user: user}, status: :ok
      else          
        render json: {result: :failur}, :status => 500

      end

    end

    def register_device

      device = Device.first_or_initialize(user_id: params[:user_id])
      device.update_attributes!(key: params[:reg_id], user_id: params[:user_id])

      if device
        render json: {result: :success}, status: :ok
      else          
        render json: {result: :failur}, :status => 500   
      end
    end


    private
      def verify_params_user
        #TODO      
      end

      def verify_params_device
        #TODO        
      end

  end
end