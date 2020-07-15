class LapsController < ApplicationController

	def index
	end

	def show
	end

	def edit 
	end

	def create
		@lap = current_user.laps.build(lap_params)

		if @lap.save
			flash[:notice] = "TimeLap was successfully created"
			redirect_to laps_path
		else
			render :new
		end
	end

	def new
	end

	private

	def lap_params
		params.require(:lap).permit(:id, :time, :setting, :hardware)
	end
end