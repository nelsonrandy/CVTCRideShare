class User < ActiveRecord::Base
  #some database fixes needed...
  has_many :rides, foreign_key: "Driver_ID"
  
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable 
  
  def admin?
    admin
  end
  
  
  def roles=(roles)
  self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end
  
  def roles
    ROLES.reject do |r|
      ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
    end
  end
  
  def is?(role)
    roles.include?(role,to_s)
  end
  
end
