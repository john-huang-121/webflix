class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # commented out from devise gem
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable

  # devise-jwt
  # devise :database_authenticatable,
  #        :jwt_authenticatable,
  #        jwt_revocation_strategy: JWTBlacklist
end
