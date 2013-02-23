class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user
    
    can :manage, :all if user.role == "admin"
    can :manage, :all if user.role == "faculty"    
    can :read,   :all if user.role == "student"
    
  end

end