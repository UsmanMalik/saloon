module Api::SmartpushApi
  class LocationsController < Api::BaseController
    
    skip_before_action :authenticate, only: [:create]
    skip_before_filter  :verify_authenticity_token

    before_action :verify_params


    def create

      location = Location.create(user_id: params[:user_id], latitude: params[:latitude], longitude: params[:longitude])
      # appointment = Appointment.create(user_id: params[:user_id], detail: params[:details], appointment_date: params[:date], appointment_time: params[:time])
      
      if location
        render json: {result: :success}, status: :ok
      else          
        render json: {result: :failur}, :status => 500
      end

    end


    private
    def verify_params
      #TODO      
    end

  end
end