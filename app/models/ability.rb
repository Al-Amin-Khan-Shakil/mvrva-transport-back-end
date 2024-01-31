class Ability
  include CanCan::Ability

  def initialize(current_user)
    @user = current_user || User.new

    if @user.admin?
      can :manage, :all
    elsif @user.user?
      can :read, :all
      can %i[destroy create], Reservation, user_id: @user.id
    else
      can :read, %i[index show], Service
    end
  end
end
