class Genre < ApplicationRecord
  has_many :songs, through: :geners_songs
end
