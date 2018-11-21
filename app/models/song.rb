class Song < ApplicationRecord
  # A song belongs to a user
  belongs_to :user
  # A song belongs to a genre
  belongs_to :genre
end
