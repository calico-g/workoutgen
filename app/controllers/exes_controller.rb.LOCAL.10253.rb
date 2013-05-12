class ExesController < ApplicationController

before_filter :authenticate_user!, :except => [:index, :show]

	def index
		if current_user
			@exes = Ex.where(:user_id => current_user.id)
		else
			redirect_to new_user_session_path
		end
	end

	def new
		@ex = Ex.new(:user_id => current_user.id)
	end

	def create
		@ex = Ex.new(params[:ex])
		@ex.user = current_user
		@ex.save

    if @ex.save
    	flash[:notice] = "Exercise added to list."
      redirect_to exes_path
    else
      flash[:alert] = "Exercise must have a name and a category."
      render :action => "new"
    end
	end

	def show
		@ex = Ex.find(params[:id])
	end

	def edit
		@ex = Ex.find(params[:id])
	end

	def update
		@ex = Ex.find(params[:id])
		if @ex.update_attributes(params[:ex])
			@ex.save
		end

		if @ex.save
    	flash[:notice] = "Exercise updated!"
      redirect_to ex_path
    else
      flash[:alert] = "Exercise did not save. Fix that shit."
      render :action => "edit"
    end

	end

	def destroy
		@ex = Ex.find(params[:id])
		@ex.destroy

		if @ex.destroy
			flash[:notice] = "Exercise deleted!"
			redirect_to exes_path
		end
	end

end
