class User < ApplicationRecord
  has_secure_password
  enum user_type: [:hostess, :admin]
  validates :username, :password, :user_type, presence: true
  validates :username, :email, uniqueness: true
end
