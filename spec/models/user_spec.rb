require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create! name: 'Tom', email: 'gordon.tinyefuza1@gmail.com', password: 'godanah', confirmed_at: Time.now }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Subject should be valid' do
    expect(subject).to be_valid
  end

end