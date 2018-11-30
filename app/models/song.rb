class Song < ApplicationRecord
  belongs_to :singer
  has_many :liked, through: :likeable
  has_many :comments, dependent: :destroy
  has_many :views_log
  has_many :genres, through: :geners_songs
end
