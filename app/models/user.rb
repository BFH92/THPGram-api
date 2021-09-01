class User < ApplicationRecord
  devise :database_authenticatable,:recoverable,
  :jwt_authenticatable,
  :registerable,:recoverable,
  jwt_revocation_strategy: JwtDenylist

  def generate_jwt
    JWT.encode({id: id, exp: 60.days.from_now.to_i}, Rails.application.secrets.secret_key_base)
  end
has_many :posts
has_many :comments
validates :email, :presence => true
end
