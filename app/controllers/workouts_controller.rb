class WorkoutsController < ApplicationController

	def index
		@workout = Workout.new(params[:workout])
		if not @workout.valid?
			flash[:alert] = "Not good. Fix it."
			render :action => 'new'
		end
	end

	def new
		@workout = Workout.new
	end
end
