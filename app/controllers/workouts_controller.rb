class WorkoutsController < ApplicationController

	def index
		@workout = Workout.new(params[:workout])
		@workout.user_id = current_user.id

		if not @workout.valid?
			flash[:alert] = "Please put a number in each field, even if it's zero. Thanks."
			redirect_to new_workout_path
		end
	end

	def new
		@workout = Workout.new
		if current_user
			@workout.user_id = current_user.id
		else
			redirect_to new_user_session_path
		end
	end
end
