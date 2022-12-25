# frozen_string_literal: true

class Member < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :user_id, presence: true
  validates :group_id, presence: true
  validates :user_id, uniqueness: { scope: %i[user_id group_id] }
end
