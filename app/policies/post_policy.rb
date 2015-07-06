class PostPolicy < ApplicationPolicy

  def index?
    true
  end
  
   class Scope < Scope
    def resolve
      if user
        if user.admin? || user.moderator?
          scope.all
        elsif user.present?
          scope.where(user_id: user)
        end 
        else 
          scope.none 
        end
    end
  end

end