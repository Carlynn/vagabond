class Location < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :users, through: :posts
end
