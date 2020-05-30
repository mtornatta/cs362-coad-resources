require 'rails_helper'

RSpec.describe Region, type: :model do

  # Stub Build
  let(:region) { build(:region) }


  describe 'Assiciation Tests' do

    it 'has many tickets' do
      expect(region).to have_many(:tickets)
    end

  end


  describe 'Validation Tests' do

    it 'must have a name' do
      expect(region).to validate_presence_of(:name)
    end

    it 'has a valid length name' do
      expect(region).to validate_length_of(:name).is_at_least(1).is_at_most(255)
    end

    it 'has a unique name (case insensitive)' do
      expect(region).to validate_uniqueness_of(:name).case_insensitive
    end

  end


  describe 'Method Tests' do

    #unspecified
    it 'creates a new unspecified region when one does not exist' do
      expect(Region.where(name: 'Unspecified')).to be_empty
      expect{ Region.unspecified }.to change { Region.count }.by 1
      expect(Region.where(name: 'Unspecified')).not_to be_empty
    end
    it 'does not create unspecified region if one exists' do
      create(:region, :unspecified)
      expect { Region.unspecified }.not_to change { Region.count }
    end

    #to_s
    it 'is represented by its name' do
      expect(region.to_s).to eq(region.name)
    end

  end


end