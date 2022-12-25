# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :comments
end
