class AddUsersToSimulators < ActiveRecord::Migration[6.0]
  def change
  	add_reference :simulators, :user, null: false, foreign_key: true
  end
end
