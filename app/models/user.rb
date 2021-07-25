class User < ApplicationRecord
    has_secure_password
    validates :username, :password, :user_type, presence: true
    validates :username, uniqueness: true
    enum user_type: [:hostess, :admin], _default: :hostess
    
end
