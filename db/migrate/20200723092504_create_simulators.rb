class CreateSimulators < ActiveRecord::Migration[6.0]
  def change
    create_table :simulators do |t|
      t.string :name

      t.timestamps
    end
  end
end
