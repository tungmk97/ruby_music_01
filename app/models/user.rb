class User < ApplicationRecord
  has_many :playlists
  has_many :comments
  has_many :liked, as: :likeable
end
