require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    let(:category) { Category.create(name: 'Test Category') }
    let(:product) { Product.new(name: 'Test Product', price: 9.99, quantity: 10, category: category) }

    it 'saves successfully with all fields set' do
      expect(product.save).to be_truthy
    end

    it 'is not valid without a name' do
      product.name = nil
      expect(product.save).to be_falsy
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it 'is not valid without a price' do
      product.price_cents = nil
      expect(product.save).to be_falsy
      expect(product.errors.full_messages).to include("Price can't be blank")
    end

    it 'is not valid without a quantity' do
      product.quantity = nil
      expect(product.save).to be_falsy
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'is not valid without a category' do
      product.category = nil
      expect(product.save).to be_falsy
      expect(product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
