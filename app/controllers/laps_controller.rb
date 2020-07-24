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
		@lap.user_id = current_user.id
		@lap.simulator_id = params[:lap][:simulator_id]
		puts @lap.simulator_id
		puts @lap.time 

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
		 :setting, :hardware, :notes, :time, :simulator_id)
	end



end