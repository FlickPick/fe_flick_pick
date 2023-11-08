class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :role, presence: true
  validates :password_digest, presence: true
  validates :uid, presence: true
  validates :provider, presence: true

  has_secure_password

  def self.from_omniauth(response)
    # require 'pry'; binding.pry
    User.find_or_create_by(uid: response[:uid], provider: response[:provider]) do |u|
      u.name = response[:info][:name]
      u.email = response[:info][:email]
      u.password = SecureRandom.hex(15)
    end
  end
end