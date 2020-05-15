require 'rails_helper'

RSpec.describe Organization, type: :model do
	
  let(:organization) { build(:organization) }


  describe 'Attribute Tests' do

  	it 'has transportation' do
  	  expect(organization).to respond_to(:transportation)
  	end

    it 'has a description' do
      expect(organization).to respond_to(:description)
    end

  end


  describe 'Presence-of Validation Tests' do

  	it 'validates presence of email' do
  	  expect(organization).to validate_presence_of(:email)
  	end

  	it 'validates presence of name' do
  	  expect(organization).to validate_presence_of(:name)
    end

  	it 'validates presence of phone' do
  	  expect(organization).to validate_presence_of(:phone)
  	end

  	it 'validates presence of status' do
  	  expect(organization).to validate_presence_of(:status)
  	end

  	it 'validates presence of primary name' do
  	  expect(organization).to validate_presence_of(:primary_name)
  	end

  	it 'validates presence of secondary name' do
  	  expect(organization).to validate_presence_of(:secondary_name)
  	end
  	
  	it 'validates presence of secondary phone' do
  	  expect(organization).to validate_presence_of(:secondary_phone)
  	end
  	
  end


  describe 'Length Validation Tests' do

  	it 'validates length of email' do
      expect(organization).to validate_length_of(:email).is_at_least(1).is_at_most(255).on(:create)
  	end

    it 'validates length of name' do
      expect(organization).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
    end

    it 'validates length of description' do
      expect(organization).to validate_length_of(:description).is_at_most(1020).on(:create)
    end
  	
  end


  describe 'Uniqueness Validation Tests' do

    it 'validates uniqueness of email' do
      expect(organization).to validate_uniqueness_of(:email).case_insensitive
    end

    it 'validates uniqueness of name' do
      expect(organization).to validate_uniqueness_of(:name).case_insensitive
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


  describe 'Method Tests' do

    #set_default_status
    it 'sets default status to submitted' do
      expect(organization.status).to eq('submitted')
    end

  end


end
