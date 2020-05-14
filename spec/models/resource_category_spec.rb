require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do

  let(:resource_category) { build(:resource_category) }


  describe 'Validation Tests' do

    it 'validates name' do
      expect(resource_category).to validate_presence_of(:name)
    end

    it 'validates length of name' do
      expect(resource_category).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
    end

    it 'validates name is unique & case insensitive' do
      expect(resource_category).to validate_uniqueness_of(:name).case_insensitive
    end
  	
  end


  describe 'Scope Tests' do

    let(:active_category) { create(:resource_category, active: true) }
    let(:inactive_category) { create(:resource_category, active: false) }

    it 'can retrieve active resource categories' do
    	active_category_list = ResourceCategory.active
      expect(active_category_list).to include(active_category)
      expect(active_category_list).not_to include(inactive_category)
    end

    it 'can retrieve inactive resource categories' do
      inactive_category_list = ResourceCategory.inactive
      expect(inactive_category_list).to include(inactive_category)
      expect(inactive_category_list).not_to include(active_category)
    end

  end


  describe 'Association Tests' do

  	it 'has and belongs to organizations' do
  	  expect(resource_category).to have_and_belong_to_many(:organizations)
  	end

    it 'has many tickets' do
      expect(resource_category).to have_many(:tickets)
    end

  end
  

end