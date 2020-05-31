require 'rails_helper'

RSpec.describe 'Creating a Region', type: :feature do
  
  let(:admin) { create(:user, :admin) }

  context 'as an admin' do
    before do
      admin.confirm
      log_in_as(admin)
    end

    it 'displays success message' do
      visit new_region_path
      fill_in 'Name', with: 'Feature Test Region'
      click_button 'Add Region'
      expect(page).to have_content('success')
    end

    it 'displays failure message when name is blank' do
      visit new_region_path
      fill_in 'Name', with: ''
      click_button 'Add Region'
      expect(page).to have_content('error')
    end
  end

end
