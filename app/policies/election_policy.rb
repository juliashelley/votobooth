class ElectionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def update?
    record.user == user
  end

  def edit?
    return true
  end

  def create?
    return true
  end

  def index?
    return true
  end
end
