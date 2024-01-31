class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :services
  has_many :reservations

  ROLES = %w[admin user].freeze

  ROLES.each do |role_name|
    define_method "#{role_name}?" do
      role == role_name
    end
  end

  def self.revoke_jwt(_payload, user)
    user.update(jti: SecureRandom.uuid)
  end
end
