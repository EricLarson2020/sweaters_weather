class User < ApplicationRecord
  validates_presence_of :email, :password
  validates :email, uniqueness: true
  validates_confirmation_of :password, on: :create

    has_secure_password



end
