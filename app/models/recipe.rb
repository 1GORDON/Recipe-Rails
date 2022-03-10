class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipeFoods, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true
  validates :cooking_time, presence: true
  validates :preperation_time, presence: true

  def self.total_value(id)
    recipe = Recipe.find(id)
    recipe_foods = recipe.recipeFoods
    recipe_foods.map { |x| RecipeFood.value(x.id) }.reduce(:+)
  end

  def self.items(id)
    recipe = Recipe.find(id)
    recipe.recipeFoods.count
  end
end
