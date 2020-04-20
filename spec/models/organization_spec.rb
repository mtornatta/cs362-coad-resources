require 'rails_helper'

RSpec.describe Organization, type: :model do
	
	let(:organization) { Organization.new }

	# instantiation test
	it 'exists' do
		organization
	end

	# attribute tests
	it 'has a status' do
		expect(organization).to respond_to(:status)
	end

end
