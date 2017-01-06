class User < ActiveRecord::Base
  has_many :postes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum role: [:user, :vip, :admin]
  def role
  	if self.admin? 
  		return "admin"
  	elsif self.vip?
  		return "vip"		
  	else	
  	 return "user"
  	end 
  end
end
