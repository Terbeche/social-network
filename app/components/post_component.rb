# frozen_string_literal: true

class PostComponent < ViewComponent::Base
  def initialize(title:, body:, post:,group:)
    @title = title
    @body = body
    @post = post
    @group = group
  end

end
