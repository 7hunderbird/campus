class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    case user.role
      when "admin"
        can :manage, :all
      when "faculty"
        can :manage, Assignment
        cannot [:destroy,:edit], Assignment
      when "student"
        can :read, :all
    end
    
  end

end