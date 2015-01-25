class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, Prayer, user_id: user.id if user.present?
    can :read, Prayer
  end
end
