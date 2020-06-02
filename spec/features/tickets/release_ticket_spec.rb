require 'rails_helper'

RSpec.describe 'Releasing a ticket by an', type: :feature do
  it 'user' do
    organization = create(:organization, :approved)
    ticket = create(:ticket, :organization)
    user = create(:user)
    user.organization = organization
    user.save
    user.confirm
    log_in_as(user)
    visit ticket_path(ticket.id)
    click_on 'Release'
    expect(current_path).to eq(dashboard_path)
  end
end
