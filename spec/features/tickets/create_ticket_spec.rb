require 'rails_helper'

RSpec.describe 'Creating a Ticket', type: :feature do
  it 'succeeds as user' do
    organization = create(:organization, :approved)
    region = create(:region)
    resource_category = create(:resource_category)
    user = create(:user)
    user.organization = organization
    user.save
    user.confirm
    log_in_as(user)
    visit "/tickets/new"
    fill_in('ticket[name]', with: 'Test Name')
    fill_in('ticket[phone]', with: '5442448777')
    select(region.name, from: 'ticket[region_id]')
    select(resource_category.name, from: 'ticket[resource_category_id]')
    click_on('Send this help request')
    expect(page).to have_content('Ticket Submitted')
  end
end
