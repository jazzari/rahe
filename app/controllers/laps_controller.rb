class LapsController < ApplicationController
		before_action :set_lap, only: [:edit, :show, :update, :destroy]
		before_action :authenticate_user!, except: [:index, :show]


	def index
		@laps = Lap.all.order(created_at: :DESC)
	end

	def show
	end

	def new
		@lap = current_user.laps.build
	end

	def create
		@lap = current_user.laps.build(lap_params)

		if @lap.save
			flash[:notice] = "TimeLap was successfully created"
			redirect_to lap_path(@lap)
		else
			puts @lap.time
			puts @lap.setting
			puts @lap.hardware
			puts @lap.notes
			puts @lap.user_id
			render :new
		end
	end

	def edit 
	end

	def update
		if @lap.update(lap_params)
			flash[:notice] = "TimeLap was updated successfully!"
			redirect_to lap_path(@lap)
		else
			render 'edit'
		end 
	end

	def destroy
		@lap.destroy
		flash[:notice] = "TimeLap was deleted successfully"

		redirect_to laps_path
	end



	private

	def set_lap 
	  	@lap = Lap.find(params[:id])
	  end

	def lap_params
		params.require(:lap).permit(:id, :t_minutes, :t_seconds, :t_millis,
		 :setting, :hardware, :notes, :time)
	end

end