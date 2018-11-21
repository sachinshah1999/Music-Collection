class Song < ApplicationRecord
  # A song belongs to a user
  belongs_to :user
end
