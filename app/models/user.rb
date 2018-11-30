class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  enum role: {admin: 1, member: 0}

  has_many :playlists
  has_many :comments
  has_many :liked, as: :likeable

  validates :name, presence: true,
    length: {maximum: Settings.title.max_length}
  validates :email, presence: true,
    length: {maximum: Settings.email.length},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: Settings.email.case_sensitive}
end
