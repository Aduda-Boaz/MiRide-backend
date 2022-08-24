class MentorSerializer
  include JSONAPI::Serializer
  attributes :full_name, :bio, :specialisation, :image_url, :user_id

  belongs_to :user
  has_many :reservations
end
