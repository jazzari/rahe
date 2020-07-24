class Simulator < ApplicationRecord

	validates :name, presence: true

	belongs_to :user
	has_many :tracks, dependent: :destroy
	has_many :cars, :through=> :tracks
	has_many :laps, :through=> :cars
end
