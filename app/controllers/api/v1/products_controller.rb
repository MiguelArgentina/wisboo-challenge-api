class Api::V1::ProductsController < ApplicationController
  def index
    @products = Product.all.limit(3)
    render json: present_products(@products).as_json(page: product_params[:page])
  end

  private
  def product_params
    params.require(:product).permit(:page, :size, :query, :currency)
  end

  def present_products(products)
    Api::V1::ProductsPresenter.new(@products)
  end
end
