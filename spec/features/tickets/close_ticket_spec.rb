require 'rails_helper'

RSpec.describe 'Closing a ticket', type: :feature do
    it 'succeeds as admin' do
        organization = create(:organization, :approved)
        admin = create(:user, :admin)
        admin.organization = organization
        admin.save
        admin.confirm
        log_in_as(admin)
        ticket = create(:ticket)
        visit ticket_path(ticket.id)
        click_on 'Close'
        expect(current_path).to eq(dashboard_path)
    end
end
