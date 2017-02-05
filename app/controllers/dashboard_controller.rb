class DashboardController < ApplicationController
	layout 'manager'
	before_action :authenticate_admin!
  def index
  end
end
