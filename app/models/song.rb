class Song < ApplicationRecord
  # A song belongs to a user
  belongs_to :user
  # A song belongs to a genre
  belongs_to :genre
  # Must have a unique title for a song
  validates :title, presence: true
  validates :title, uniqueness: true
end
