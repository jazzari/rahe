class Simulator < ApplicationRecord

	validates :name, presence: true

	belongs_to :user
	has_many :tracks
	has_many :laps, :through=> :tracks
end
