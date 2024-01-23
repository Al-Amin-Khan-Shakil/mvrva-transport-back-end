# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(current_user)
    @user = current_user || User.new

    if @user.role == 'admin'
      can :manage, :all
    else
      can :read, :all
      can %i[destroy create], Reservation, user_id: @user.id
    end
  end
end
