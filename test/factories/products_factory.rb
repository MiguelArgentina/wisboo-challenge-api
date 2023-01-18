CURRENCIES = %w[USD EUR GBP].freeze

FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    image { Faker::LoremFlickr.image }
    price { Faker::Commerce.price }
    currency { CURRENCIES.sample }
    quantity { rand(1..100) }
  end
end
