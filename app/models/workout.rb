class Workout < ActiveRecord::Base
  attr_accessible :cardio, :strength, :stretch, :total
  validates :cardio, :strength, :stretch, :total, :presence => true,
  																								:numericality => true
  																								{ :only_integer => true,
  																									:greater_than => -1 }
  validates :total, :numericality => { :greater_than => 0 }

  def cardios
  	if cardio > 0
 			cardios = Ex.where(:category => 'cardio')
  		cardios[rand(cardios.count)]
  	end
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
