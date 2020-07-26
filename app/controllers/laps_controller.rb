class LapsController < ApplicationController
		before_action :set_lap, only: [:edit, :show, :update, :destroy]
		before_action :authenticate_user!, except: [:index, :show]
		before_action :last_lap, only: [:new]

	def index
		@laps = Lap.all.order(created_at: :DESC)
		unless current_user.blank?
			@laps = Lap.where(:user_id => current_user.id).order(created_at: :DESC)
		end
	end

	def show

	end

	def new
		
	end

	def create
		@lap = current_user.simulators.build.tracks.build.cars.build.laps.build(lap_params)
		@lap.user_id = current_user.id
		@lap.simulator_id = params[:lap][:simulator_id]
		@lap.track_id = params[:lap][:track_id]
		@lap.car_id = params[:lap][:car_id]

		if @lap.save
			flash[:notice] = "TimeLap was successfully created"
			redirect_to lap_path(@lap)
		else
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
		 :setting, :hardware, :notes, :time, :simulator_id, :track_id, :car_id)
	end

	def last_lap
		@lap = Lap.where(:user_id => current_user.id).last
	end

end