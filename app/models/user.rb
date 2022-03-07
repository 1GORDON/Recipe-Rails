class User < ApplicationRecord
  has_many :inventories
  has_many :foods
  has_many :recipes
end
