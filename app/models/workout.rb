class Workout < ActiveRecord::Base
  attr_accessible :cardio, :strength, :stretch, :total, :user_id
  validates :cardio, :strength, :stretch, :total, :presence => true,
  																								:numericality => true
  																								{ :only_integer => true,
  																									:greater_than => -1 }
  #validates :total, :numericality => { :greater_than => 0 }

  def cardios
  	if cardio > 0
 			cardios = Ex.where(:category => 'cardio', :user_id => self.user_id)
  		cardios[rand(cardios.count)]
  	end
  end

  def strengths
  	strengths = Ex.where(:category => 'strength', :user_id => self.user_id)
		(1..strength/2).to_a.map do
			strengths[rand(strengths.count)]
		end
	end

	def stretches
		stretches = Ex.where(:category => 'stretch', :user_id => self.user_id)
		(1..stretch/2).to_a.map do
			stretches[rand(stretches.count)]
		end
	end

  def check_for_exes
    if @workout.cardio > 0 && Ex.where(:user_id => current_user.id, :category => :cardio).empty?
      flash[:alert] = "You must add some cardio exercises"
      redirect_to exes_path
  end
end
