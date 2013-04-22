class Workout < ActiveRecord::Base
  attr_accessible :cardio, :strength, :stretch, :total

  def cardios
  	cardios = Ex.where(:category => 'cardio')
  	cardios[rand(cardios.count)]
  end

  def strengths
  	strengths = Ex.where(:category => 'strength')
		(1..strength/2).to_a.map do
			strengths[rand(strengths.count)]
		end
	end

	def stretches
		stretches = Ex.where(:category => 'stretch')
		(1..stretch/2).to_a.map do
			stretches[rand(stretches.count)]
		end
	end
end
