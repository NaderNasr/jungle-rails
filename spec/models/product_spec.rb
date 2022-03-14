require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it "is valid with valid attributes" do
      @category = Category.create()
      @product = Product.create(
        name: "product name",
        price_cents: 2000,
        quantity: 3,
        category: @category
      )
      expect(@product).to be_valid
      expect(@product.errors.full_messages).not_to include("not valid")
    end

    it "is not valid without a name" do
      @category = Category.create
      @product = Product.create(
        name: nil,
        price_cents: 2000,
        quantity: 5,
        category: @category
      )
      expect(@product).to_not be_valid
    end

    it "fails when price is not set" do
      @category = Category.new
      @product = Product.new(
        name: 'test name',
        price_cents: nil,
        quantity: 3,
        category: @category
      )
      # pp @product.errors
      expect(@product).to_not be_valid
    end

    it "is not valid without a quantity" do
      @category = Category.create
      @product = Product.create(
        name: 'name',
        price_cents: 2000,
        quantity: nil,
        category: @category
      )
      # pp @product.errors
      # expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "is not valid without a category" do
      @category = Category.create
      @product = Product.create(
        name: 'name',
        price_cents: 2000,
        quantity: 5,
        category: nil
      )
      expect(@product).to_not be_valid
    end
  end
end
