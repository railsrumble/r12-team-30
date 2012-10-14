class Ability
  include CanCan::Ability

  def initialize(user)

    can :read, :all

    if user
      if user.admin?
        can :manage, :all
      end

      can [:read, :create], Store
      can [:update, :manage_orders], Store, owner_id: user.id

      can [:update, :confirm, :complete], Order, owner_id: user.id
    end

  end
end
