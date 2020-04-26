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

	# describe 'validations' do
	# 	it 'validates name' do
	# 		expect(resourceCategory).to validate_presence_of(:name)
	# 	end
	# end
	
end