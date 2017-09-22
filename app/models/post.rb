class Post < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :location, optional: true

  validates_length_of :title, :within => 1..200, :too_long => "Title is too long!", :too_short => "Title is too short!" , allow_blank: false
end
