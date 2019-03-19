class VotePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def confirmation?
    true
  end

  def create?
    true
  end

  def thank_you?
    true
  end
end
