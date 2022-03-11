require 'rails_helper'

RSpec.describe Food, type: :model do
   user1 = User.new(name: 'Tom', email: 'gbuldie11@gmail.com', password: 'godanah12112', confirmed_at: Time.now)

  subject { Food.create! name: 'Milk', measurement_unit: 'grams', price: '10', user: user1 }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Measurement unit should be present' do
    expect(subject).to be_valid
  end

  it 'Price should be present' do
    subject.price = 0
    expect(subject).to_not be_valid
  end

end