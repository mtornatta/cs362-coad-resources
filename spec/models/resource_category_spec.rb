require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
	
	let(:resourceCategory) { ResourceCategory.new }

	describe 'existence' do
		it 'exists' do
			ResourceCategory.new
		end
	end

	describe 'attributes' do

		it 'responsds to name' do
			expect(resourceCategory).to respond_to(:name)
		end

	end

	describe 'all validations' do

		it 'validates name' do
			expect(resourceCategory).to validate_presence_of(:name)
		end

		it 'validates length of name' do
			expect(resourceCategory).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
		end

		it 'validates name is case insensitive' do
			expect(resourceCategory).to validate_uniqueness_of(:name).case_insensitive
		end
		
	end

	describe '#active' do

		it 'retrieves only active resource categories' do
			
		end

	end
	
end