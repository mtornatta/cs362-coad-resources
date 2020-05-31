require 'rails_helper'

RSpec.describe 'Deleting a Region', type: :feature do

  let(:admin) { create(:user, :admin) }
  let(:region) { create(:region) }

  context 'as an admin' do
    before do
      admin.confirm
      log_in_as(admin)
      region.save
    end

    it 'displayed deletion message on success' do
      visit region_path(region.id)
      click_link 'Delete'
      expect(page).to have_content('deleted')
    end
  end

end
