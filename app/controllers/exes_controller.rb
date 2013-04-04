class ExesController < ApplicationController
	def index
		@exes = Ex.all
	end

	def new
		@ex = Ex.new
	end

	def create
		@ex = Ex.new(params[:ex])
		@ex.save

    if @ex.save
    	flash[:notice] = "Exercise added to list."
      redirect_to exes_path
    else
      flash[:alert] = "Exercise did not save. Fix that shit."
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
      redirect_to exes_path
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