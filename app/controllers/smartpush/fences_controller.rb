module Smartpush
  class FencesController < Smartpush::BaseController
    layout :false
    skip_before_filter  :verify_authenticity_token
    def index
      
    end

    def create

    fences_array = params[:fences_arr]
    if fences_array != nil
      parsed_fences = parsed = JSON.parse(fences_array)
      logger.info parsed_fences
      
      parsed_fences.each do |fence|
        _lat= fence["lat"]
        _lng= fence["lng"]
        _rad = fence["radius"]

        if Fence.validate_fence(_rad,_lat,_lng) == true
          @fence = Fence.create(ad_id:1,latitude:_lat,longitude:_lng,radius:_rad)
        else
          logger.info "not a valid fence"
        end

      end

    end
      respond_to do |format|
        if @fence.save
          format.html { redirect_to fences_path, notice: 'Ad was successfully created.' }
          format.json { render :show, status: :created, location: @fence }
        else
          format.html { render :new }
          format.json { render json: @fence.errors, status: :unprocessable_entity }
        end
      end

  end

    # # PATCH/PUT /ads/1
    # # PATCH/PUT /ads/1.json
    # def update
    #   respond_to do |format|
    #     if @ad.update(ad_params)
    #       format.html { redirect_to @ad, notice: 'Ad was successfully updated.' }
    #       format.json { render :show, status: :ok, location: @ad }
    #     else
    #       format.html { render :edit }
    #       format.json { render json: @ad.errors, status: :unprocessable_entity }
    #     end
    #   end
    # end

    private

      # Never trust parameters from the scary internet, only allow the white list through.
      def ad_params
        params.require(:ad).permit(:ad_id, :latitude, :longitude, :radius)
      end

  end
end