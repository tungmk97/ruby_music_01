require "rails_helper"

RSpec.describe Playlist, type: :model do
  it {should validate_presence_of :name}
  it do
    should validate_length_of(:name).
      is_at_most 100
  end
  it do
    should validate_length_of(:description).
      is_at_most 3000
  end
end
