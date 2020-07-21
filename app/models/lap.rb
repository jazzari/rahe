class Lap < ApplicationRecord

	validates :time, presence: true, 
		numericality: { greater_than: 999, less_than: 3600000,  only_integer: true }
	validates :setting, inclusion: { in: [ true, false ] }
	validates :hardware, inclusion: { in: [ true, false ] }
	validates :notes, length: {minimum: 5, maximum: 280}, allow_blank: true

	belongs_to :user

	# virtual attributes to parse user's input
	def t_minutes
		@t_minutes
	end

	def t_minutes=(value)
		self.time = value.to_i * 60000
	end

	def t_seconds
		@t_seconds
	end

	def t_seconds=(value)
		self.time += value.to_i * 1000
	end

	def t_millis
		@t_millis
	end

	def t_millis=(value)
		self.time += value.to_i
	end

	
	def formated_time(time)
		@formated_time = ""

		# format minutes
		f_min = time / 60000
		if f_min < 10
			@formated_time = "0" + f_min.to_s
		else
			@formated_time = f_min.to_s
		end

		# format seconds
		f_sec = (time - (f_min * 60000)) / 1000
		if f_sec < 10
			@formated_time += ":0" + "#{f_sec}"
		else
			@formated_time += ":" + "#{f_sec}"
		end

		# format milliseconds
		f_mil = (time - (f_min * 60000) - (f_sec * 1000))
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