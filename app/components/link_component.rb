# frozen_string_literal: true

class LinkComponent < ViewComponent::Base
  def initialize(link:, text:)
    @link = link
    @text = text
  end
end
