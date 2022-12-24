class Group < ApplicationRecord
  has_many :posts
  has_many :members, dependent: :destroy
  has_many :users, through: :members

end
