class User < ApplicationRecord
    has_secure_password
    validates :username, :password, :user_type, presence: true
    validates :username, uniqueness: true
    
end
