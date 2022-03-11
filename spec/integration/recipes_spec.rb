require 'rails_helper'

RSpec.describe 'Recipe Index', type: :feature do
  describe 'Recipe' do
    before(:each) do
      @user1 = User.create! name: 'Justin', password: '000000', email: 'justin@gmail.com',
      confirmed_at: Time.now
      @recipe = @user1.recipes.create(name: 'Recipe 1', description: 'Public recipe', cooking_time: '1', preperation_time: '1')
      visit('/users/sign_in')
      fill_in 'Email', with: 'justin@gmail.com'
      fill_in 'Password', with: '000000'
      click_button 'Log in'
      visit recipes_path
    end

    it 'shows confirmation that user is logged in' do
        expect(page).to have_content('Logged in as justin@gmail.com.')
     end

     it 'has button to add a new recipe' do
        expect(page).to have_selector(:link_or_button, 'Add Recipe')
    end

    it 'has a table for foods' do
        expect(page).to have_content('Recipe 1')
    end

    it 'has button to add a new recipe' do
        expect(page).to have_selector(:link_or_button, 'Delete')
    end

  end
end
