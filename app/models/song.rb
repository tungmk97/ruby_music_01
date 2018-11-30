class Song < ApplicationRecord
  belongs_to :singer
  has_many :liked, as: :likeable
  has_many :comments, dependent: :destroy
  has_many :view_logs
  has_many :genre_songs
  has_many :genres, through: :genre_songs

  validates :title, presence: true,
    length: {maximum: Settings.title.max_length}
  validates :song_url, presence: true,
    uniqueness: true
  validates :view, numericality: true
end
