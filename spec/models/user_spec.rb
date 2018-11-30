require "rails_helper"

RSpec.describe User, type: :model do
  it {should validate_presence_of :name}
  it do
    should validate_length_of(:name).
      is_at_most 100
  end
  it {should validate_presence_of :email}
  it do
    should validate_length_of(:email).
      is_at_most 50
  end
end
