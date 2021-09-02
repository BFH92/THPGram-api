class User < ApplicationRecord
  devise :database_authenticatable,:recoverable,
  :jwt_authenticatable,
  :registerable,:recoverable,
  jwt_revocation_strategy: JwtDenylist


has_many :posts
has_many :comments
validates :email, :presence => true
end
