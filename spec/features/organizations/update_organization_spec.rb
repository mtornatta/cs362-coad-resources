require 'rails_helper'

RSpec.describe 'Updating an Organization', type: :feature do
    let(:organization) {create(:organization)}

    context 'As an admin' do
        it 'updating an organization successfully' do
            visit edit_organization_path(organization)
            fill_in(:name).with('New Fake Name')
            click 'Save'
            expect(page).to have_content('New Fake Name')
        end
    end

    context 'As an org user' do
        let (:user) {create(:organization, :approved)}
        let (:organization) {create(:organization, :approved)}

        before do
            user.organization = organization
            user.save
        end

        it 'updating an organization successfully' do
            visit edit_organization_path(organization)
            fill_in(:name).with('New Fake Name')
            click 'Save'
            expect(page).to have_content('New Fake Name')
        end
    end
end
