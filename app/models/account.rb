class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # commented out from devise and devise-jwt gem
  devise :registerable, :recoverable, :rememberable,
         :validatable, :database_authenticatable, :jwt_authenticatable,
         jwt_revocation_strategy: JwtBlacklist
end
