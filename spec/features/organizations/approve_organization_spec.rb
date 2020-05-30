require 'rails_helper'

RSpec.describe 'Approving an organization', type: :feature do
  let(:organization) {create(:organization, :submitted)}
  let(:admin) {create(:user, :admin)}
  
  describe 'as an admin' do
    before do
      admin.confirm
      sign_in(admin)
    end
    it 'approves an organization successfully' do
        visit("/organizations/#{organization.id}")
        click_button('Approve')
        expect(page).to have_content("#{organization.name}")
    end
  end
end
