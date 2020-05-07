require 'rails_helper'

RSpec.describe Ticket, type: :model do
    let(:ticket) { build(:ticket) }
    let(:open_ticket) { create(:ticket, closed: false) }
    let(:closed_ticket) { create(:ticket, closed: true) }

  describe 'Attribute Tests' do

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

  end

  describe 'Association Tests' do

    it 'belongs to a region' do
        expect(ticket).to belong_to(:region)
    end

    it 'belongs to a resource category' do
        expect(ticket).to belong_to(:resource_category)
    end

    # it 'belongs to an organization' do
    #   class Ticket < ApplicationRecord
    #     belongs_to :organization, optional: true
    #   end
    #   expect(ticket).to belong_to(:organization)
    # end

  end

  describe 'Scope Tests' do

    it 'can retrieve just open tickets' do
      open_ticket_list = Ticket.open
      expect(open_ticket_list).to include(open_ticket)
      expect(open_ticket_list).not_to include(closed_ticket)
    end

    it 'can retrieve just closed tickets' do
      closed_ticket_list = Ticket.closed
      expect(closed_ticket_list).to include(closed_ticket)
      expect(closed_ticket_list).not_to include(open_ticket)
    end

  end

    

end
