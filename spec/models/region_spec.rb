require 'rails_helper'

RSpec.describe Region, type: :model do
    let(:region) { Region.new }

    # instantiation test
	it 'exists' do
		region
	end

	# attribute tests
	it 'has a name' do
		expect(region).to respond_to(:name)
	end
end
