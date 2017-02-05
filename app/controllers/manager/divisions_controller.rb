module Manager
	class DivisionsController < ApplicationController
    
    before_action :set_division, only: [:show, :edit, :update, :destroy]
    layout "application"


    def index
      @divisions = Division.all
      @division = Division.new      
    end


    def show
    end

    def new
      @division = Division.new
    end

    def edit
    end

    def create
      @division = Division.new(division_params)

      respond_to do |format|
        if @division.save
          format.html { redirect_to divisions_path, notice: 'Category was successfully created.' }
          format.json { render :show, status: :created, location: @division }
        else
          format.html { render :new }
          format.json { render json: @division.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @division.update(division_params)
          format.html { redirect_to divisions_path, notice: 'Category was successfully updated.' }
          format.json { render :show, status: :ok, location: @division }
        else
          format.html { render :edit }
          format.json { render json: @division.errors, status: :unprocessable_entity }
        end
      end
    end


    def destroy
      @division.destroy
      respond_to do |format|
        format.html { redirect_to divisions_url, notice: 'Category was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_division
        @division = Division.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def division_params
        params.require(:division).permit(:main,:description,:avatar,:for)
      end

	end
end
