require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "is valid with all attributes" do
      user = User.create(first_name: "Briana", last_name: "May", email: "briana@gmail.com", password: "123", password_confirmation: "123")
      expect(user).to be_valid
    end

    it "is valid when password and password_confirmation match" do
      user = User.create(first_name: "Briana", last_name: "May", email: "briana@gmail.com", password: "123", password_confirmation: "1234")
      expect(user).to_not be_valid
    end

    it "is invalid without unique email" do
      user1 = User.create(first_name: "Briana", last_name: "May", email: "briana@gmail.com", password: "123", password_confirmation: "1234")
      user2 = User.create(first_name: "Briana", last_name: "May", email: "BRIANA@gmail.com", password: "123", password_confirmation: "1234")
      expect(user2).to_not be_valid
    end

    it "is invalid with a password less than 3 characters" do
      user = User.create(first_name: "Briana", last_name: "May", email: "briana@gmail.com", password: "12", password_confirmation: "12")
      expect(user).to_not be_valid
    end
  end
end
