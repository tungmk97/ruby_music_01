class Playlist < ApplicationRecord
  belongs_to :user
  has_many :songs, through: :playlists_songs
  has_many :liked, as: :likeable

  scope :order_desc, ->{order created_at: :desc}

  validates :user_id, presence: true
  validates :name, presence: true, length: {maximum: Settings.length_description}
end
