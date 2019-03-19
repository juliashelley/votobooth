class CandidaturePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    return true
  end

  def show?
    true
  end

  def new?
    record.user == user
  end

  def create?
    record.user == user
  end
end
