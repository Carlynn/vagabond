class Location < ApplicationRecord
  has_many :posts, dependent: :destroy
end
