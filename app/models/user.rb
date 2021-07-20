class User < ApplicationRecord
    enum user_type: [:hostess, :admin]
end
