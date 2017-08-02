class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def welcome
   render "layouts/_temp_header"
  end
end
