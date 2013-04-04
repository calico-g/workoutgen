class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.integer :total
      t.integer :cardio
      t.integer :strength
      t.integer :stretch

      t.timestamps
    end
  end
end
