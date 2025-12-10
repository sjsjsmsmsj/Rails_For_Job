class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }
  validates :first_name, :lastname, presence: true
  def full_name
    "#{firstname} #{last_name}"
  end
end
