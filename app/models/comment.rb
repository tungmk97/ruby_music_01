class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :song

  validates :content, presence: true,
    length: {maximum: Settings.content.max_length}
end
