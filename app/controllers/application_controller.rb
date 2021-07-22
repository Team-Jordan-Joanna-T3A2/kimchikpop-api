class ApplicationController < ActionController::API

    def decode()
        
    end

    def encode(payload)
        JWT.encode(payload, Rails.application.secrets.jwt_secret_key)
    end

    def authenticated
        # if authorized, go ahead otherwise stop
        request.authori
        unless authorized
            render json: { message: 'Unauthorized Please log in'}
        end        
    end
end
