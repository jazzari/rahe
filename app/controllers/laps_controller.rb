class LapsController < ApplicationController
		before_action :set_lap, only: [:edit, :show, :update, :destroy]
		before_action :authenticate_user!, except: [:index, :show]
		before_action :formated_time, only: [:show]

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

	def formated_time
		@formated_time = ""
		parser_time = @lap.time 

		# format minutes
		f_min = parser_time / 60000
		if f_min < 10
			@formated_time = "0" + f_min.to_s
		else
			@formated_time = f_min.to_s
		end

		# format seconds
		f_sec = (parser_time - (f_min * 60000)) / 1000
		if f_sec < 10
			@formated_time += ":0" + "#{f_sec}"
		else
			@formated_time += ":" + "#{f_sec}"
		end

		# format milliseconds
		f_mil = (parser_time - (f_min * 60000) - (f_sec * 1000))
		if f_mil < 100 && f_mil > 9
			@formated_time += ".0" + "#{f_mil}"
		elsif f_mil < 10
			@formated_time += ".00" + "#{f_mil}"
		else
			@formated_time += "." + "#{f_mil}"
		end

		@formated_time
	end

end