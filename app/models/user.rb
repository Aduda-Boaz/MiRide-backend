class User < ApplicationRecord
  has_secure_password
  has_many :mentors
  has_many :reservations

  validates_presence_of :email_address, on: :create, message: "can't be blank"
  validates_uniqueness_of :email_address, on: :create, message: 'must be unique'
end
