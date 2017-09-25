class User < ApplicationRecord
  has_many :posts, dependent: :destroy

  has_secure_password

  # Handles the URLS
  include FriendlyId
  friendly_id :first_name_and_last_name, use: [:finders, :slugged]

  # Handles image uploader - the :image is from the schema
  # mount_uploader :image, ImageUploader

  def first_name_and_last_name
  "#{first_name}-#{last_name}"
  end
  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user ? @user.authenticate(params[:password]) : false
  end
end
