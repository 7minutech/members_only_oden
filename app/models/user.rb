class User < ApplicationRecord
  has_many :posts

  validates :name, presence: true, uniqueness: true, length: { maximum: 30 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 254 }
  validates :password, presence: true, length: { minimum: 6, maximum: 20 }
end
