# frozen_string_literal: true

class Group < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :members, dependent: :destroy
  has_many :users, through: :members
  validates :name, presence: true, length: { maximum: 100 }, allow_blank: false, uniqueness: true
end
