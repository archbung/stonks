require 'rails_helper'

RSpec.describe User, type: :model do
  it "can create new User" do
    user = create :user
    created_user = User.find_by(id: user.id)

    expect(created_user).to eq user
  end
end
