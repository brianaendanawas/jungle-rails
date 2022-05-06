require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "is valid with all attributes" do
      user = User.new(first_name: "Briana", last_name: "May", email: "briana@gmail.com", password: "123", password_confirmation: "123")
      expect(user.errors.full_messages).to be_empty
    end
  end
end
