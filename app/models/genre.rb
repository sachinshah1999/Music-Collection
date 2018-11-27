class Genre < ApplicationRecord
  # A genre can have many songs. Destroy songs if genre is deleted.
  has_many :songs, dependent: :destroy
end
