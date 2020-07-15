class AddUsersToLaps < ActiveRecord::Migration[6.0]
  def change
    add_reference :laps, :user, null: false, foreign_key: true
  end
end
