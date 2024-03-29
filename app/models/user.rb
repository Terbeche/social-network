# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :comments
  has_many :members, dependent: :destroy
  has_many :groups, through: :members

  validates :name, presence: true, allow_blank: false
  validates :email, presence: true, allow_blank: false
end
