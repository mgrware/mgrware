class DashboardController < ApplicationController
	layout "dashboard"
 	before_action :check_current_user, :check_current_profile
 	def index
 		@profile = Profile.find_by_user_id(current_user.id)
 	end
end
