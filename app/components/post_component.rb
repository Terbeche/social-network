# frozen_string_literal: true

class PostComponent < ViewComponent::Base
  def initialize(title:, body:, post: '', group: '', current_user: '')
    @title = title
    @body = body
    @post = post
    @group = group
    @current_user = current_user
  end
end
