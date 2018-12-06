class Song < ApplicationRecord
  SONG_ATTRIBUTES = %i(singer_id title lyrics song_url view).freeze

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

  scope :include_to_song, ->{includes :singer, :comments, :genres}
  scope :hot_feed, ->{order view: :desc}
end
