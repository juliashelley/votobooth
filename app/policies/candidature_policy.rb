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

  def approval?
    record.election.user == user
  end

  def accept?
    record.election.user == user
  end

  def destroy?
    record.user == user
  end

  # should confirmation be here? Check vote_policy.rb
  def confirmation?
    true
  end

  def thank_you?
    true
  end
end
