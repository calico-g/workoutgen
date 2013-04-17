class WorkoutsController < ApplicationController

	def index
	end

	def new
		@workout = Workout.new
	end

	def create
		@workout = Workout.new(params[:workout])
		@workout.save

		if @workout.save
			flash[:notice] = "Here's your workout. Enjoy!"
			redirect_to @workout
		else
			flash[:alert] = "Could not generate workout. Fix that shit."
			render :action => "new"
		end
	end

	def show
		@workout = Workout.find(params[:id])
	end

end
