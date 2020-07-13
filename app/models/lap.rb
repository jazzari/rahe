class Lap < ApplicationRecord

	validates :time, presence: true, 
		numericality: { greater_than: 999, less_than: 3600000,  only_integer: true }
	validates :setting, inclusion: { in: [ true, false ] }
	validates :hardware, inclusion: { in: [ true, false ] }
	validates :notes, length: {minimum: 5, maximum: 280}, allow_blank: true
end