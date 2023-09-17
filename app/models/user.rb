class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true
    normalize :email, with: :downcase

    attr_accessor :password_challenge
end
