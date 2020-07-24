class CarsController < ApplicationController

	def index
		@cars = Car.all.order(:name)
	end

	def new
		@car = Car.new
		@car.laps.build
	end
end