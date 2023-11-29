# frozen_string_literal: true

class TalkPolicy < ApplicationPolicy
  def create?
    admin?
  end

  def update?
    admin?
  end

  private

  def admin?
    user.admin?
  end
end