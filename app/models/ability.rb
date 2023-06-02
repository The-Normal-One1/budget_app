class Ability
    include CanCan::Ability

    def initialize(user)
      # Define abilities for the user here. For example:
      #

      user ||= User.new # guest user (not logged in)

      can :read, :pages, name: 'splash'

      # return unless user.persisted? 

      # can :manage, :all

      if user.persisted? # logged in
        can :manage, :all, user_id: user.id
      else
        can :read, :pages, name: 'splash' # allow access to splash page for unauthenticated users
      end
    # if user.persisted? # logged in
    #   can :manage, Group, user_id: user.id
    #   can :manage, Specification, user_id: user.id
    #   can :manage, User, id: user.id
    # No abilities for guest users (not logged in)
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end
