class Song < ApplicationRecord
  # A song belongs to a user
  belongs_to :user
  # A song belongs to a genre
  belongs_to :genre
  # Title must be present
  validates :title, presence: true
  # Must have a unique title for a song
  validates :title, uniqueness: true
end
