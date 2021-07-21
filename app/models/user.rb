class User < ApplicationRecord
    enum user_type: [:hostess, :admin]
    validates :username :password :user_type, presence: true
    validates :password, length: { greater_than: 6 }  
end
