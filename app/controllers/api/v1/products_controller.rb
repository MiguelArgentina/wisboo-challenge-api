class Api::V1::ProductsController < ApplicationController
  def index
    query = product_params[:query]
    currency = product_params[:currency]
    page = product_params[:page].to_i
    size = product_params[:size].to_i
    @products = Product.search(query).filter_by_currency(currency).page(page, size).per(size)
    render json: present_products(@products).as_json(page: page)
  end

  private
  def product_params
    params.require(:product).permit(:page, :size, :query, :currency)
  end

  def present_products(products)
    Api::V1::ProductsPresenter.new(@products)
  end
end
