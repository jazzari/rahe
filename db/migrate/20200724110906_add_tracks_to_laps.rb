class AddTracksToLaps < ActiveRecord::Migration[6.0]
  def change
  	add_reference :laps, :track, null: false, foreign_key: true
  end
end
