class Lap < ApplicationRecord

	validates :time, presence: true, 
		numericality: { greater_than: 999, less_than: 3600000,  only_integer: true }
	validates_inclusion_of :setting, :in => [true, false]
	validates :hardware, inclusion: { in: [ true, false ] }
	validates :notes, length: {minimum: 5, maximum: 280}, allow_blank: true

	belongs_to :user

	def t_minutes
		@t_minutes
	end

	def t_minutes=(value)
		self.time = value.to_i * 60000
	end


end