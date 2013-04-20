class WorkoutsController < ApplicationController

	def index
		@workout = Workout.new(params[:workout])

	end

	def new
		@workout = Workout.new
	end

end
