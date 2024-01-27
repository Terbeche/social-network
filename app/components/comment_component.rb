# frozen_string_literal: true

class CommentComponent < ViewComponent::Base
  def initialize(username:, text:, current_user:, group:, post:, comment:)
    @username = username
    @text = text
    @current_user = current_user
    @group = group
    @post = post
    @comment = comment
  end
end
