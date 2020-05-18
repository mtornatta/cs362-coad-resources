require 'rails_helper'

RSpec.describe Region, type: :model do

  # Stub Build
  let(:region) { build(:region) }


  describe 'Validation Tests' do

    it 'validates presence of name' do
      expect(region).to validate_presence_of(:name)
    end

    it 'validates length of name' do
      expect(region).to validate_length_of(:name).is_at_least(1).is_at_most(255)
    end

    it 'validates uniqueness of name (case insensitive)' do
      expect(region).to validate_uniqueness_of(:name).case_insensitive
    end

  end


  describe 'Assiciation Tests' do

    it 'has many tickets' do
      expect(region).to have_many(:tickets)
    end

  end


end