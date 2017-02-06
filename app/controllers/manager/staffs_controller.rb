module Manager
	class StaffsController < ApplicationController
    
    before_action :set_staff, only: [:show, :edit, :update, :destroy]
    layout "application"


    def index
      @staffs = Staff.all
      @staff = Staff.new      
    end


    def show
    end


    def new
      @staff = Staff.new
    end


    def edit
    end


    def create
      @staff = Staff.new(staff_params)

      respond_to do |format|
        if @staff.save
          format.html { redirect_to staffs_path, notice: 'Staff was successfully created.' }
          format.json { render :show, status: :created, location: @staff }
        else
          format.html { render :new }
          format.json { render json: @staff.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @staff.update(staff_params)
          format.html { redirect_to staffs_path, notice: 'Staff was successfully updated.' }
          format.json { render :show, status: :ok, location: @staff }
        else
          format.html { render :edit }
          format.json { render json: @staff.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @staff.destroy
      respond_to do |format|
        format.html { redirect_to staffs_url, notice: 'Staff was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_staff
        @staff = Staff.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def staff_params
        params.require(:staff).permit(:first_name, :last_name, :date_of_birth, :description, :age, :email, :phone_number, :address, :status)
      end

	end
end
