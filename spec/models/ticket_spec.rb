require 'rails_helper'

RSpec.describe Ticket, type: :model do
    let(:ticket) { Ticket.new }

    # instantiation test
	it 'exists' do
		ticket
	end

	# attribute tests
	it 'has a name' do
        expect(ticket).to respond_to(:name)
    end
    it 'has a phone' do
        expect(ticket).to respond_to(:phone)
    end
    it 'has a region_id' do
        expect(ticket).to respond_to(:region_id)
    end
    it 'has a resource_category_id' do
        expect(ticket).to respond_to(:resource_category_id)
    end

    #Scope Tests
    it 'retrieves an open ticket' do
        open_ticket = Ticket.create(closed: true, organization_id: Organization.new)
        open_tickets = Ticket.open
        expect(open_tickets).to include(open_ticket)
    end
end
