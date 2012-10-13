class Ability
  include CanCan::Ability

  def initialize(user)

    can :read, :all

    if user
      if user.admin?
        can :manage, :all
      end

      can :create, Store
      can :update, Store, owner_id: user.id
    end

  end
end
