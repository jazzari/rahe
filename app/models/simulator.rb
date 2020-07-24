class Simulator < ApplicationRecord

	#validates :name, presence: true

	belongs_to :user
	has_many :laps
end
