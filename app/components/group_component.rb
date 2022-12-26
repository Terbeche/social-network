# frozen_string_literal: true

class GroupComponent < ViewComponent::Base
  def initialize(group:, name:, member:, group_membership:, current_user:)
    @group = group
    @name = name
    @member = member
    @group_membership = group_membership
    @current_user = current_user
  end
end
