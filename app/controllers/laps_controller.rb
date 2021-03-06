class LapsController < ApplicationController
		before_action :set_lap, only: [:edit, :show, :update, :destroy]
		before_action :authenticate_user!, except: [:index, :show]


	def index
		#@laps = Lap.all.order(created_at: :DESC)
		unless current_user.blank?
			@laps = Lap.where(:user_id => current_user.id).order(created_at: :DESC)
		end
	end

	def show

	end

	def new
		@laps = Lap.where(:user_id => current_user.id)

		if @laps.exists?
			# last Lap params used to fill new's form
			@lap = @laps.last.dup
			# gon variables to pass values to jquery select options
			gon.sim = @lap.simulator.name
			gon.track = @lap.track.name
			gon.car = @lap.car.name

			else
			# when user have no previous Laps created
			@lap = current_user.laps.build
			gon.sim = {}

		end
	end

	def create
		@lap = current_user.laps.build(lap_params)
		@lap.user_id = current_user.id
		@lap.simulator_id = params[:lap][:simulator_id]
		@lap.track_id = params[:lap][:track_id]
		@lap.car_id = params[:lap][:car_id]

		if @lap.save
			flash[:notice] = "TimeLap was successfully created"
			redirect_to laps_path
		else
			render :new
		end
	end

	def edit 
		# gon variables to pass to jquery in edit viewΩ
		gon.sim = @lap.simulator.name
		gon.track = @lap.track.name
		gon.car = @lap.car.name
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

end