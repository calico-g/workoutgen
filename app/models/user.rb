class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :id
  # attr_accessible :title, :body

  has_many :exes

  def has_exes(cat)
  	my_exes = Ex.where(:category => cat, :user_id => self.id)
  	!my_exes.empty?
  end

end
