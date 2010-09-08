class Ability
  include CanCan::Ability

  def initialize(user)
  user ||= User.new
    if user.role == "admin"
      can :manage, :all
    else
      can :read, :all
      can :create, User
      if user.role == "member"
        can :update, User do |user_me|
          user_me.try(:full_name) == user.full_name
        end
        can :create, Project
        can :member_add, Project
        can :member_remove, Project
      end
    end
  end
end
