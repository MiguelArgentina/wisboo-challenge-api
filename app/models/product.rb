class Product < ApplicationRecord
  CURRENCIES = %w[USD EUR GBP].freeze
  validates :name, :price, :currency, :quantity,  presence: true
  validates :name, uniqueness: true
  validates :price, numericality: { greater_than: 0 }
  validates :currency, inclusion: { in: CURRENCIES }
end
