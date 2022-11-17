class User < ApplicationRecord

  has_secure_password

  # name validation
  validates :name, presence: true,
                   length: { 
                    maximum: 30, 
                    allow_blank: true 
                   }

  # password validation
  VALID_PASSWORD_REGEX = /\A[\w\-]+\z/
  validates :password, presence: true,
                      length: { 
                        minimum: 8,
                        allow_blank: true
                      },
                      format: {
                        with: VALID_PASSWORD_REGEX,
                        allow_blank: true,
                        message: :invalid_password
                      },
                      allow_nil: true
end
