class Playlist < ApplicationRecord
  belongs_to :user
  has_many :playlist_songs
  has_many :songs, through: :playlist_songs
  has_many :liked, as: :likeable

  validates :name, presence: true,
      length: {maximum: Settings.title.max_length}
  validates :description, length: {maximum: Settings.content.max_length}
end
