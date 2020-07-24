class SimulatorsController < ApplicationController

	def index
		@simulators = Simulator.all.order(:name)
	end

	def new
		@simulators = Simulator.new
		@simulators.tracks.build
	end
end