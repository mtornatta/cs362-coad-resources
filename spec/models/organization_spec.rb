require 'rails_helper'

RSpec.describe Organization, type: :model do
	
  # Stub Build
  let(:organization) { build(:organization) }


  describe 'Attribute Tests' do

  	it 'can have transportation' do
  	  expect(organization).to respond_to(:transportation)
  	end

    it 'can have a description' do
      expect(organization).to respond_to(:description)
    end

  end


  describe 'Association Tests' do

    it 'has many users' do
      expect(organization).to have_many(:users)
    end

    it 'has many tickets' do
      expect(organization).to have_many(:tickets)
    end
    
    it 'has and belongs to many resource categories' do
      expect(organization).to have_and_belong_to_many(:resource_categories)
    end

  end


  describe 'Validation Tests' do

    describe 'Presence-of' do

    	it 'must have a email' do
    	  expect(organization).to validate_presence_of(:email)
    	end

    	it 'must have a name' do
    	  expect(organization).to validate_presence_of(:name)
      end

    	it 'must have a phone' do
    	  expect(organization).to validate_presence_of(:phone)
    	end

    	it 'must have a status' do
    	  expect(organization).to validate_presence_of(:status)
    	end

    	it 'must have a primary name' do
    	  expect(organization).to validate_presence_of(:primary_name)
    	end

    	it 'must have a secondary name' do
    	  expect(organization).to validate_presence_of(:secondary_name)
    	end
    	
    	it 'must have a secondary phone' do
    	  expect(organization).to validate_presence_of(:secondary_phone)
    	end

    end

    describe 'Length' do

      it 'has a valid length email' do
        expect(organization).to validate_length_of(:email).is_at_least(1).is_at_most(255).on(:create)
      end

      it 'has a valid length name' do
        expect(organization).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
      end

      it 'has a valid length description' do
        expect(organization).to validate_length_of(:description).is_at_most(1020).on(:create)
      end

    end

    describe 'Uniqueness' do

      it 'has a unique email (case insensitive)' do
        expect(organization).to validate_uniqueness_of(:email).case_insensitive
      end

      it 'has a unique name (case insensitive)' do
        expect(organization).to validate_uniqueness_of(:name).case_insensitive
      end

    end
  	
  end


  describe 'Method Tests' do

    #approve
    it 'can set status to approved' do
      # IMPLEMENT
    end

    #reject
    it 'can set status to rejected' do
      # IMPLEMENT
    end

    #set_default_status
    it 'sets default status to submitted' do
      expect(organization.status).to eq('submitted')
    end

  end


end
