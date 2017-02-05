module Api
  class DivisionsController < Api::BaseController
    
    skip_before_action :authenticate, only: [:index]
    # skip_before_filter  :verify_authenticity_token

    def index
      divisions = Division.all
      render :json => divisions.to_json(:only => [:id,:main,:description], :methods => [:avatar_url_medium,:avatar_url_thumb,:avatar_url_original])
    end

  end
end