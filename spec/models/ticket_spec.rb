require 'rails_helper'

RSpec.describe Ticket, type: :model do

  # Stub Builds
  let(:ticket) { build(:ticket) }
  let(:open_ticket) { build(:ticket, :open) }
  let(:closed_ticket) { build(:ticket, :closed) }

  # Database Builds
  let(:open_ticket_entry) { create(:ticket, :open) }
  let(:closed_ticket_entry) { create(:ticket, :closed) }


  describe 'Attribute Tests' do

    it 'can have an organization_id' do
      expect(ticket).to respond_to(:organization_id)
    end

    it 'can have a description' do
      expect(ticket).to respond_to(:description)
    end

  end


  describe 'Validation Tests' do

    describe 'Presence-of' do

      it 'must have a name' do
        expect(ticket).to validate_presence_of(:name)
      end

      it 'must have a phone' do
        expect(ticket).to validate_presence_of(:phone)
      end

      it 'must have a region_id' do
        expect(ticket).to validate_presence_of(:region_id)
      end

      it 'must have a resource_category_id' do
        expect(ticket).to validate_presence_of(:resource_category_id)
      end

    end

    describe 'Length' do

      it 'has a valid length name' do
        expect(ticket).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
      end

      it 'has a valid length description' do
        expect(ticket).to validate_length_of(:description).is_at_most(1020).on(:create)
      end

    end

  end


  describe 'Association Tests' do

    it 'belongs to a region' do
      expect(ticket).to belong_to(:region)
    end

    it 'belongs to a resource category' do
      expect(ticket).to belong_to(:resource_category)
    end

    it 'can belong to an organization' do
      expect(ticket).to belong_to(:organization).optional
    end

  end


  describe 'Scope Tests' do

    it 'can retrieve all open tickets' do
      open_ticket_list = Ticket.open
      expect(open_ticket_list).to include(open_ticket_entry)
      expect(open_ticket_list).not_to include(closed_ticket_entry)
    end

    it 'can retrieve all closed tickets' do
      closed_ticket_list = Ticket.closed
      expect(closed_ticket_list).to include(closed_ticket_entry)
      expect(closed_ticket_list).not_to include(open_ticket_entry)
    end

  end


  describe 'Method Tests' do

    #open?
    it 'can verify that a single ticket is open' do
      expect(open_ticket.open?).to be_truthy
    end
    it 'can verify that a single ticket is closed' do
      expect(closed_ticket.open?).to be_falsy
    end

    #to_s
    it 'is represented by its ID' do
      expect(ticket.to_s).to eq("Ticket #{ticket.id}")
    end

  end

    
end
