class UserSerializer
  include JSONAPI::Serializer
  attributes :full_name, :username, :email_address

  has_many :mentors
  has_many :reservations
end
