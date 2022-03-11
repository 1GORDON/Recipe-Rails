require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before(:each) do
    user1 = User.create! name: 'Justin', password: '000000', email: 'justin@gmail.com',
                         confirmed_at: Time.now

    subject do
      user1.recipes.create(name: 'Recipe 1', cooking_time: '1 hour', preperation_time: '3 hours',
                           description: 'a recipe')
    end

    subject.save
  end

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Cooking time should be present' do
    subject.cooking_time = nil
    expect(subject).to_not be_valid
  end

  it 'Preparation time should be present' do
    subject.preperation_time = nil
    expect(subject).to_not be_valid
  end

  it 'Description should be present' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'Public should be false' do
    expect(subject.public).to_not be(true)
  end
end
