require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before(:each) do
    user1 = User.create! name: 'Justin', password: '000000', email: 'justin@gmail.com',
                         confirmed_at: Time.now
    food = Food.new(name: 'Milk', measurement_unit: 'grams', price: '10', user: user1)

    recipe = user1.recipes.new(name: 'Recipe 1', cooking_time: '1 hour', preperation_time: '3 hours',
                               description: 'a recipe')

    subject { RecipeFood.new(food: food, quantity: 10, recipe: recipe) }

    subject.save
  end

  it 'quantity cannot be less than 1' do
    subject.quantity = 0.5
    expect(subject).to_not be_valid
  end
end
