class Playlist < ApplicationRecord
  belongs_to :user
  has_many :songs, through: :playlists_songs
  has_many :liked, as: :likeable
end
