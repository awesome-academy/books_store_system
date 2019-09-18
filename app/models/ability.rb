class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new

    if user.admin?
      can :access, :rails_admin
      can :read, :dashboard
      can :manage, :all
    else
      can :manage, Review, user_id: user.id
      can :manage, Order, user_id: user.id
      can [:read, :update], User, id: user.id
    end
  end
end
