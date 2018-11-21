class Genre < ApplicationRecord
  # A genre can have many songs
  has_many :songs
end
