require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
	
	let(:resourceCategory) { ResourceCategory.new }

	# instantiation test
	it 'exists' do
		ResourceCategory.new
	end

	# attribute tests
	it 'has a <something>' do
	end
	
end
