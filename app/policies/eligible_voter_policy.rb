class EligibleVoterPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # user refers to current_user from devise, and record to the class instance
  def show?
    true
  end

  def new?
    record.user == user
  end

  def create?
    return true
  end
end
