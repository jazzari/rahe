class TracksController < ApplicationController

	def index
		@tracks = Track.all.order(:name)
	end

	def new
		@track = Track.new
		@track.laps.build
	end
end