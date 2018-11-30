require "rails_helper"

RSpec.describe Genre, type: :model do
  it {should validate_presence_of :title}
  it do
    should validate_length_of(:title).
      is_at_most 100
  end
end
