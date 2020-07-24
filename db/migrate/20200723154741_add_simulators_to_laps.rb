class AddSimulatorsToLaps < ActiveRecord::Migration[6.0]
  def change
  	add_reference :laps, :simulator, null: false, foreign_key: true
  end
end
