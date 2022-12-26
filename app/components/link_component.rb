# frozen_string_literal: true

class LinkComponent < ViewComponent::Base
  def initialize(link:, name:)
    @link = link
    @name = name
    
  end
end
