require "test_helper"

class Api::V1::ProductsPresenterTest < ActionDispatch::IntegrationTest
  test "should generate the correct json to present products at #index" do
    products = create_products(5)
    products_presenter = Api::V1::ProductsPresenter.new(products)
    products_json = products_presenter.as_json(page: 1)

    assert_equal products_json[:metadata][:page], 1
    assert_equal products_json[:metadata][:total_records], products.size
    assert_equal products_json[:products].size, products.size
  end

  def create_products (quantity)
    products = []
    quantity.times do |i|
      product = create(:product)
      product.name = "#{product.name} #{i}"
      products << product
    end
    products
  end
end
