class Product < ApplicationRecord
  CURRENCIES = %w[USD EUR GBP].freeze
  validates :name, :price, :currency, :quantity,  presence: true
  validates :name, uniqueness: true
  validates :price, numericality: { greater_than: 0 }
  validates :currency, inclusion: { in: CURRENCIES }

  scope :search, ->(query) { where('name ILIKE ?', "%#{query}%") }
  scope :filter_by_currency, ->(currency) { where(currency: currency) }
  scope :page, ->(page, size) { offset((page - 1) * size) }
  scope :per, ->(size) { limit(size) }

end
