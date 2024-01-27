# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :comments, dependent: :destroy

  validates :title, presence: true, allow_blank: false, length: { maximum: 250 }
  validates :body, presence: true, allow_blank: false
end
