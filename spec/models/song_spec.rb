require "rails_helper"

RSpec.describe Song, type: :model do
  it {should validate_presence_of :title}
  it do
    should validate_length_of(:title).
      is_at_most 100
  end
  it {should validate_presence_of :song_url}
  it {should validate_numericality_of :view}
end
