class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :locations, through: :posts
end
