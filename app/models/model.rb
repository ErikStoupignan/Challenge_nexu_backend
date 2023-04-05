class Model < ApplicationRecord
  belongs_to :brand
  scope :greaterThan, ->(greater = 0) { where('average_price >= ?', greater) }
  scope :smallerThan, ->(smaller = Float::INFINITY) { where('average_price <= ?', smaller) }

  validates :name, uniqueness: { scope: :brand_id }
  validates :average_price, comparison: { greater_than: 100_000 }
end
