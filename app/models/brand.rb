class Brand < ApplicationRecord
  has_many :models, dependent: :delete_all

  validates :name, uniqueness: true, presence: true
end
