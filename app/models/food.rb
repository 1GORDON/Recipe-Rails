class Food < ApplicationRecord
  belongs_to :user
  has_many :inventoryFoods
  has_many :recipeFoods
  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 1 }
end
