  class Ability
      include CanCan::Ability
 
      def initialize(user)

        #raise user.role   
        if user.role=="admin"
           can :manage, :all
        elsif user.role=="vip"
              can [:read,:create,:update], Post  

        elsif user.role=="user"
          can :manage, Post# , { currrentid: user.id }

         else
          raise user.role 
        end

    end
  end

