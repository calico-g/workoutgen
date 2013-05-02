class WorkoutsController < ApplicationController


	def index
		@workout = Workout.new(params[:workout])
		@workout.user_id = current_user.id

		if not @workout.valid?
			flash[:alert] = "Not good. Fix it."
			render :action => 'new'
		end
	end

	def new
		@workout = Workout.new
	end
end
