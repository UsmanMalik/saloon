module Manager
  class DashboardController < ApplicationController
  	layout 'application'

	before_action :authenticate_admin!

	  def index

	  end

	def test_page
      
    end

 end
end
