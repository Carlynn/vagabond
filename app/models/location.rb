class Location < ApplicationRecord
  include FriendlyId
  has_many :posts, dependent: :destroy

  friendly_id :city, use: [:finders, :slugged]

end
