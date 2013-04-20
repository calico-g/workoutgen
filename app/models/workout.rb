class Workout < ActiveRecord::Base
  attr_accessible :cardio, :strength, :stretch, :total

  def exercises
  	strengths = Ex.where(:category => 'strength')
		(1..strength/2).to_a.map do
			strengths[rand(strengths.count)]
		end
	end
end
