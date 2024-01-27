class Ability
  include CanCan::Ability

  def initialize(current_user)
    @user = current_user || User.new

    if @user.admin?
      can :manage, :all
    elsif @user.user?
      can :read, :all
      can :destroy, Reservation, user_id: @user.id
      can :create, Reservation do |reservation|
        reservation.user_id == @user.id
      end
    else
      can %i[index show], Service
    end
  end
end
