class ReservationSerializer
  include JSONAPI::Serializer
  attributes :user_id, :mentor_id, :duration

  belongs_to :user
  belongs_to :mentor
end
