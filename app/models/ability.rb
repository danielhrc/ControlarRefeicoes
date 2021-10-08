class Ability
  include CanCan::Ability
  def initialize(user)
    if !user.nil?
      can :manage, :all
    else
      can [:read, :update, :destroy], Refeicao
      can :manage, User
    end
  end
end