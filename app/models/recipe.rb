class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipeFoods
  validates :name, presence: true
  validates :description, presence: true
  validates :cooking_time, presence: true
  validates :preperation_time, presence: true
end
