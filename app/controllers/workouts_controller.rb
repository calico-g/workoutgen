class WorkoutsController < ApplicationController

	def index
		@workout = Workout.new(params[:workout])
		@workout.user_id = current_user.id

		#makes sure there are exercises in the model
		if @workout.cardio > 0 && Ex.where(:user_id => current_user.id, :category => :cardio).empty?
			flash[:alert] = "You must add some cardio exercises"
			redirect_to exes_path
		elsif
			@workout.strength > 0 && Ex.where(:user_id => current_user.id, :category => :strength).empty?
			flash[:alert] = "You must add some strength exercises"
			redirect_to exes_path
		elsif
			@workout.stretch > 0 && Ex.where(:user_id => current_user.id, :category => :stretch).empty?
			flash[:alert] = "You must add some stretch exercises"
			redirect_to exes_path
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
