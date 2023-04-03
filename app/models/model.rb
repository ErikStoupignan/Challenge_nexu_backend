class Model < ApplicationRecord
  belongs_to :brand

  validates :name, uniqueness: true, presence: true
end
