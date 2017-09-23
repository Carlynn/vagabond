class Location < ApplicationRecord
  has_many :posts, dependent: :destroy
  include FriendlyId
  friendly_id :city_country, use: [:finders, :slugged]
  def city_country
  "#{city}-#{country}"
  end
end
