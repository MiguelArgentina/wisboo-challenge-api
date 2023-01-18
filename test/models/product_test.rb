require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test "should create a product" do
    product = Product.new(name: "Product 1", image: "my_image.jpg", price: 10.0, currency: Product::CURRENCIES.sample, quantity: 10)
    assert product.save
  end

  test "should create a product without an image" do
    product = Product.new(name: "Product 1", price: 10.0, currency: Product::CURRENCIES.sample, quantity: 10)
    assert product.save
  end

  test "should not create a product with duplicate name" do
    Product.create(name: "Product 1", image: "my_image.jpg", price: 10.0, currency: Product::CURRENCIES.sample, quantity: 10)
    product = Product.new(name: "Product 1", image: "my_image.jpg", price: 10.0, currency: Product::CURRENCIES.sample, quantity: 10)
    assert_not product.save
  end

  test "should not create a product without name" do
    product = Product.new(image: "my_image.jpg", price: 10.0, currency: Product::CURRENCIES.sample, quantity: 10)
    assert_not product.save
  end

  test "should not create a product without price" do
    product = Product.new(name: "Product 1", image: "my_image.jpg", currency: Product::CURRENCIES.sample, quantity: 10)
    assert_not product.save
  end

  test "should not create a product without currency" do
    product = Product.new(name: "Product 1", image: "my_image.jpg", price: 10.0, quantity: 10)
    assert_not product.save
  end

  test "should not create a product with invalid currency" do
    product = Product.new(name: "Product", image: "my_image.jpg", price: 10.0, currency: "made_up_currency", quantity: 10)
    assert_not product.save
  end
end
