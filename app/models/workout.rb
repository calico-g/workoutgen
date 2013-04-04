class Workout < ActiveRecord::Base
  attr_accessible :cardio, :strength, :stretch, :total
end
