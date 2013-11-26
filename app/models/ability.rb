class Ability
  include CanCan::Ability

  def initialize(user)

    if user.role?('admin')
     can :manage, :all
    end

    if user.role?('basic')
      can :manage, Policy, user_id: user.id
      cannot :change_commission, Policy
    end

  end
end
