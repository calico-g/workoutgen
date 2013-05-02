class ApplicationController < ActionController::Base
  protect_from_forgery

   # before_filter do |c|
   #   User.current_user_id = User.find(c.session[:user_id]) unless c.session[:user].nil?
   # end
end
