# frozen_string_literal: true

class MemberComponent < ViewComponent::Base
  def initialize(member:, group:, current_user:)
    @member = member
    @group = group
    @current_user = current_user
  end
end
