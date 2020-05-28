require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do

  # Stub Builds
  let(:resource_category) { build(:resource_category) }

  # Database Builds
  let(:active_category_entry) { create(:resource_category, active: true) }
  let(:inactive_category_entry) { create(:resource_category, active: false) }


  describe 'Association Tests' do

    it 'has and belongs to organizations' do
      expect(resource_category).to have_and_belong_to_many(:organizations)
    end

    it 'has many tickets' do
      expect(resource_category).to have_many(:tickets)
    end

  end


  describe 'Validation Tests' do

    it 'must have a name' do
      expect(resource_category).to validate_presence_of(:name)
    end

    it 'has a valid length name' do
      expect(resource_category).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
    end

    it 'has a unique name (case insensitive)' do
      expect(resource_category).to validate_uniqueness_of(:name).case_insensitive
    end
  	
  end


  describe 'Scope Tests' do

    it 'can retrieve active resource categories' do
      active_category_list = ResourceCategory.active
      expect(active_category_list).to include(active_category_entry)
      expect(active_category_list).not_to include(inactive_category_entry)
    end

    it 'can retrieve inactive resource categories' do
      inactive_category_list = ResourceCategory.inactive
      expect(inactive_category_list).to include(inactive_category_entry)
      expect(inactive_category_list).not_to include(active_category_entry)
    end

  end


  describe 'Method Tests' do

    #unspecified
    it 'creates a new unspecified resource category when one does not exist' do
      expect(ResourceCategory.where(name: 'Unspecified')).to be_empty
      expect{ ResourceCategory.unspecified }.to change { ResourceCategory.count }
      expect(ResourceCategory.where(name: 'Unspecified')).not_to be_empty
    end
    it 'does not create unspecified resource category if one exists' do
      create(:resource_category, :unspecified)
      expect { ResourceCategory.unspecified }.not_to change { ResourceCategory.count }
    end

    #activate
    it 'can set active to true' do
      # IMPLEMENT
    end

    #deactivate
    it 'can set active to false' do
      # IMPLEMENT
    end

    

  end


end