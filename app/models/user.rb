
class User < ApplicationRecord

  has_secure_password
  validates :password, length: { minimum: 8 }, allow_nil: true

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true
end