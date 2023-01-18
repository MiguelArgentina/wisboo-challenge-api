
CURRENCIES = %w[USD EUR GBP].freeze
Product.delete_all
50.times do |i|
  Product.create!(
    name: "#{Faker::Commerce.product_name} i" ,
    image: Faker::LoremFlickr.image,
    price: Faker::Commerce.price,
    currency: CURRENCIES.sample,
    quantity: rand(1..100)
  )
end
