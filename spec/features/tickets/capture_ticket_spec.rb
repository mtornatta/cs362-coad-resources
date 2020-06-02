require 'rails_helper'

RSpec.describe 'Capturing a ticket', type: :feature do
    it 'succeeds as organization user' do
        organization = create(:organization, :approved)
        user = create(:user)
        user.organization = organization
        user.save
        user.confirm
        log_in_as(user)
        ticket = create(:ticket)
        visit ticket_path(ticket.id)
        click_on 'Capture'
        expect(current_path).to eq(dashboard_path)
    end
end
