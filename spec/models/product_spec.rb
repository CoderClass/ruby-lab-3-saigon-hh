require 'rails_helper'

RSpec.describe Product, type: :model do
  # Use .alphabetical because it's a class method. Example: Product.alphabetical
  # Use #long_name when #long_name is an instance method. Example: @product.long_name


  describe ".alphabetical" do
    it "returns [] when there are no products" do
      expect(Product.alphabetical).to eq []
    end

    it "returns [a] when there is only one product a" do
      # a = Product.create!(...)
      product = FactoryGirl.create(:product, name: 'a')
      expect(Product.alphabetical).to eq [product]
    end

    it "returns [a,b,c] after I create 3 products c, b, a" do
      	product1 = FactoryGirl.create(:product, name: 'b')
	  	product2 = FactoryGirl.create(:product, name: 'c')
	  	product3 = FactoryGirl.create(:product, name: 'a')

	  	expect(Product.alphabetical).to eq [product3, product1, product2]

    end
  end
end