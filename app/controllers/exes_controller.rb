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
      redirect_to root_path
    else
      flash[:alert] = "Project has not been created."
      render :action => "new"
    end
	end

	def show
	end

end
