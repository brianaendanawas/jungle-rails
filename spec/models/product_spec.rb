require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "product will save with all four fields" do
      category = Category.create(name: "Food")
      product = Product.create(name: "Apple", price: 10, quantity: 5, category: category)
      expect(product.errors.full_messages).to be_empty
    end

    it "is not valid without a name" do
      category = Category.create(name: "Food")
      product = Product.create(name: nil, price: 10, quantity: 5, category: category)
      expect(product.errors.full_messages).not_to be_empty
    end

    it "is not valid without a price" do
      category = Category.create(name: "Food")
      product = Product.create(name: "Apple", quantity: 5, category: category)
      expect(product.errors.full_messages).not_to be_empty
    end

    it "is not valid without a quantity" do
      category = Category.create(name: "Food")
      product = Product.create(name: "Apple", price: 10, quantity: nil, category: category)
      expect(product.errors.full_messages).not_to be_empty
    end

    it "is not valid without a category" do
      category = Category.create(name: "Food")
      product = Product.create(name: "Apple", price: 10, quantity: 5, category: nil)
      expect(product.errors.full_messages).not_to be_empty
    end
  end
end 
