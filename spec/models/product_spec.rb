require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'should have a name of grater' do
      @category = Category.new
      @product = Product.new(:name => 'grater', :price => 13, :quantity => 10, :category => @category)
      @product.save!

      expect(@product.name).to be_present
    end
    
    it 'should have a nil name' do
      @category = Category.new
      @product = Product.new(:name => nil, :price => 13, :quantity => 10, :category => @category)

      expect(@product.name).to be_nil
    end
    
    it 'should have an error with nil name' do
      @category = Category.new
      @product = Product.new(:name => nil, :price => 13, :quantity => 10, :category => @category)
      @product.save

      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should have a price of 13' do
      @category = Category.new
      @product = Product.new(:name => 'grater', :price => 13, :quantity => 10, :category => @category)
      @product.save!
      price = ((@product.price) * 100).to_i / 100

      expect(price).to eq(13)
    end

    it 'should have 0.00 for price value of nil' do
      @category = Category.new
      @product = Product.new(:name => 'grater', :price => nil, :quantity => 10, :category => @category)

      expect(@product.price).to eq(0.00)
    end

    it 'should have quantity of 0 when set to nil' do
      @category = Category.new
      @product = Product.new(:name => 'grater', :price => 13, :quantity => nil, :category => @category)

      expect(@product.quantity).to be_nil
    end
  end
end
