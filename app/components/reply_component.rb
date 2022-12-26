# frozen_string_literal: true

class ReplyComponent < ViewComponent::Base
  def initialize(text:)
    @text = text
  end

end
