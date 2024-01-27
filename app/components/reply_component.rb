# frozen_string_literal: true

class ReplyComponent < ViewComponent::Base
  def initialize(text:, username:)
    @username = username
    @text = text
  end
end
