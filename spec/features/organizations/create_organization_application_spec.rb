require 'rails_helper'

RSpec.describe 'Creating an Organization Application', type: :feature do
  let(:user) {create(:user)}
  
  describe 'as a user' do
    before do
      user.confirm
      log_in_as(user)
      create(:user, :admin)
    end

    it 'fills out and submits an application page successfully' do
        visit organization_path("dashboard")
        click_on('Create Application')
        choose('organization[agreement_one]')
        choose('organization[agreement_three]')
        choose('organization[agreement_four]')
        choose('organization[agreement_five]')
        choose('organization[agreement_six]')
        choose('organization[agreement_seven]')
        choose('organization[agreement_eight]')
        fill_in('What is your name? (Last, First)', with: 'Test Name')
        fill_in('Organization Name', with: 'Test Organization')
        fill_in('What is your title? (if applicable)', with: 'Test Title')
        fill_in('What is your direct phone number? Cell phone is best.', with: '1231234567')
        fill_in('Who may we contact regarding your organization\'s application if we are unable to reach you?', with: 'Test Contact')
        fill_in('What is a good secondary phone number we may reach your organization at?', with: '7654321321')
        fill_in('What is your Organization\'s email?', with: 'fake@fake.com')
        choose('organization_transportation_no')
        click_on('Apply')
        expect(page).to have_content('Application Submitted')
    end
   end
end
