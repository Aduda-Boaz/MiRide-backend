class User < ApplicationRecord
  has_many :mentors
  has_many :reservations

  # validates :email_address, presence: true, uniqueness: { case_sensitive: false }
end
