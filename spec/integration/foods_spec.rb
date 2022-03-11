require 'rails_helper'

RSpec.describe 'Food Index', type: :feature do
  describe 'Food' do
    before(:each) do
      @user1 = User.create! name: 'Justin', password: '000000', email: 'justin@gmail.com',
      confirmed_at: Time.now
      visit('/users/sign_in')
      fill_in 'Email', with: 'justin@gmail.com'
      fill_in 'Password', with: '000000'
      click_button 'Log in'
      visit root_path
    end

    it 'shows confirmation that user is logged in' do
        expect(page).to have_content('Logged in as justin@gmail.com.')
     end

     it 'has button to add new food' do
        expect(page).to have_selector(:link_or_button, 'Add Food')
    end

    it 'has a table for foods' do
        expect(page).to have_content('Food')
    end

  end
end
