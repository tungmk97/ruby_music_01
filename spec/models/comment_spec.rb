require "rails_helper"

RSpec.describe Comment, type: :model do
  it do
    should validate_length_of(:content).
      is_at_most 3000
  end
end
