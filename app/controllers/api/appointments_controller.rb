module Api
  class AppointmentsController < Api::BaseController
    
    skip_before_action :authenticate, only: [:create]
    skip_before_filter  :verify_authenticity_token

    before_action :verify_params


    def create
      appointment = Appointment.create(user_id: params[:user_id], detail: params[:details], appointment_date: params[:date], appointment_time: params[:time])
      
      if appointment
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