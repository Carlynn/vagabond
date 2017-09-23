class Location < ApplicationRecord
  has_many :posts, dependent: :destroy
  include FriendlyId
  friendly_id :city, use: [:finders, :slugged]
end
