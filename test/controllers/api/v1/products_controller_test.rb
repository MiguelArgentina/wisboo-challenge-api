require "test_helper"

class Api::V1::ProductsControllerTest < ActionDispatch::IntegrationTest
  test "making a post request to api_v1_products_index_url should respond with the correct json" do
    post api_v1_products_index_url, params: { product: { page: 1, size: 3, query: "test", currency: "USD" } }
    assert_response :success
    assert_equal response.content_type, "application/json; charset=utf-8"
    assert_equal JSON.parse(response.body)['metadata']['page'], 1
    assert_equal JSON.parse(response.body)['metadata']['total_records'], 3
    assert_equal JSON.parse(response.body)['products'].size, 3
  end
end
