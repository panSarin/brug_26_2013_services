class Ability
  include CanCan::Ability

  def initialize(user)

    if user.role?('admin')
     can :manage, :all
     can :autocomplete_product_name, :all
     can :change_commission, Policy
    end

    if user.role?('basic')
      can :manage, Policy, user_id: user.id
      can :autocomplete_product_name, Product
    end

  end
end
