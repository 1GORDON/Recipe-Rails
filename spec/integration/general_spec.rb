require 'rails_helper'

RSpec.describe 'Recipe Index', type: :feature do
  describe 'Recipe' do
    before(:each) do
      @user1 = User.create! name: 'Justin', password: '000000', email: 'justin@gmail.com',
                            confirmed_at: Time.now
      @recipe = @user1.recipes.create(name: 'Recipe 1', description: 'Public recipe', cooking_time: '1',
                                      preperation_time: '1')
      visit('/users/sign_in')
      fill_in 'Email', with: 'justin@gmail.com'
      fill_in 'Password', with: '000000'
      click_button 'Log in'
      click_on 'General Shopping List'
    end

    it 'shows confirmation that user is logged in' do
      expect(page).to have_content('Shopping List')
    end

    it 'has a table for foods' do
      expect(page).to have_content('Food')
      expect(page).to have_content('Quantity')
      expect(page).to have_content('Price')
      expect(page).to have_content('Amount of food items to buy: 0')
    end
  end
end
