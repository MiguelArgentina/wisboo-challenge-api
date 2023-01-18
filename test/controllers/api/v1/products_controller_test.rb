require "test_helper"

class Api::V1::ProductsControllerTest < ActionDispatch::IntegrationTest
  test "request #index for 2 products should respond with the correct json" do
    post api_v1_products_index_url, params: { product: { page: 1, size: 2, query: "Product10", currency: "USD" } }
    assert_response :success
    assert_equal response.content_type, "application/json; charset=utf-8"
    assert_equal JSON.parse(response.body)['metadata']['page'], 1
    assert_equal JSON.parse(response.body)['metadata']['total_records'], 2
    assert_equal JSON.parse(response.body)['products'].size, 2
  end

  test "request #index for 3 products should respond with the correct json" do
    post api_v1_products_index_url, params: { product: { page: 1, size: 3, query: "Product10", currency: "USD" } }
    assert_response :success
    assert_equal response.content_type, "application/json; charset=utf-8"
    assert_equal JSON.parse(response.body)['metadata']['page'], 1
    assert_equal JSON.parse(response.body)['metadata']['total_records'], 3
    assert_equal JSON.parse(response.body)['products'].size, 3
  end

  test "request #index for 1 product should respond with the correct json" do
    post api_v1_products_index_url, params: { product: { page: 1, size: 3, query: "Product10", currency: "EUR" } }
    assert_response :success
    assert_equal response.content_type, "application/json; charset=utf-8"
    assert_equal JSON.parse(response.body)['metadata']['page'], 1
    assert_equal JSON.parse(response.body)['metadata']['total_records'], 1
    assert_equal JSON.parse(response.body)['products'].size, 1
  end
end
