class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # layout 'manager'


  layout :layout_by_resource

  protected

  def layout_by_resource
    if devise_controller?
    	false
    else
      "application"
    end
  end


end
