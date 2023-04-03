class Model < ApplicationRecord
  belongs_to :brand

  validates :name, uniqueness: true, presence: true
  validates :average_price, comparison: { greater_than: 100_000 }
end
