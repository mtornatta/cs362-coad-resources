require 'rails_helper'

RSpec.describe 'Updating an Organization', type: :feature do

  let(:organization) {create(:organization, :approved)}

  context 'As an admin' do
    let(:admin) { create(:user, :admin) }
    before do
      admin.confirm
      log_in_as(admin)
    end
     it 'updating an organization successfully' do
       visit edit_organization_path(organization)
       fill_in 'Name', with: 'New Fake Name'
       click_on 'Update Resource'
       expect(page).to have_content('New Fake Name')
     end
   end

  context 'As an org user' do

    let (:user) {create(:user)}

    before do
      user.organization = organization
      user.confirm
      log_in_as(user)
    end
    it 'updating an organization successfully' do
      visit edit_organization_path(organization)
      fill_in 'Name', with: 'New Fake Name'
      click_on 'Update Resource'
      expect(page).to have_content('New Fake Name')
    end
  end
end
