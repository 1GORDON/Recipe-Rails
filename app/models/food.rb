class Food < ApplicationRecord
  belongs_to :user
  has_many :inventoryFoods
  has_many :recipeFoods
end
