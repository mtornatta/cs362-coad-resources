require 'rails_helper'

RSpec.describe 'Logging in', type: :feature do

  context 'as an admin' do

    let(:admin) { create(:user, :admin) }

    before do
      admin.confirm
    end

    it 'is successful' do
      visit login_path
      fill_in 'Email', with: admin.email
      fill_in 'Password', with: 'password'
      click_on 'Sign in'
      expect(page).to have_content('successful')
    end

  end

  context 'as a registered user' do

    let(:user) { create(:user) }

    before do
      user.confirm
    end

    it 'is successful' do
      visit login_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'password'
      click_on 'Sign in'
      expect(page).to have_content('successful')
    end

  end

end
