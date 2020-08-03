class Simulator < ApplicationRecord

	validates :name, uniqueness: true, presence: true

	has_many :tracks, dependent: :destroy
	has_many :cars, :through=> :tracks
	has_many :laps, :through=> :cars

	accepts_nested_attributes_for :tracks, allow_destroy: true
end
