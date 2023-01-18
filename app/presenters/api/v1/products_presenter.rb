class Api::V1::ProductsPresenter
  def initialize(products)
    @products = products
  end

  def as_json(options = {})
    {
      metadata: {
        page: options[:page].to_i || 1,
        total_records: @products.size
      },
        products: @products.map { |product| ProductPresenter.new(product).as_json }
    }
  end

  class ProductPresenter
    def initialize(product)
      @product = product
    end

    def as_json(options = {})
      {
        id: @product.id,
        name: @product.name,
        image: @product.image,
        price: @product.price,
        currency: @product.currency,
        quantity: @product.quantity
      }
    end
  end
end

