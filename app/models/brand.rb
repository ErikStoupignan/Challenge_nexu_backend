class Brand < ApplicationRecord
  has_many :models, dependent: :delete_all

  validates :name, uniqueness: true, presence: true
  validates :average_price, comparison: { greater_than: 100_000 }
end
