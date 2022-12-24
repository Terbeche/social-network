class User < ApplicationRecord
    has_and_belongs_to_many :groups
    has_many :posts
    has_many :comments
end
