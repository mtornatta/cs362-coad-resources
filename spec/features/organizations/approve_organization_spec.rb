require 'rails_helper'

RSpec.describe 'Approving an organization', type: :feature do
  
  let(:organization) { create(:organization, :submitted) }
  let(:admin) { create(:user, :admin) }
  
  context 'as an admin' do
    before do
      admin.confirm
      log_in_as(admin)
      organization.save
    end

    it 'approves an organization successfully' do
        visit organization_path(organization.id)
        click_on('Approve')
        expect(page).to have_content('approved')
    end

  end

end
