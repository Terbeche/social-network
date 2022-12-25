# frozen_string_literal: true

class CommentComponent < ViewComponent::Base
  def initialize(username:, text:)
    @username = username
    @text = text
  end

end
