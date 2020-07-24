3.times do |i|
	Lap.create(time: 12000, setting: false, hardware: false, notes: "Notes N #{i}", 
		simulator_id: 1, track_id: 1, car_id: 1, user_id: 2)
end