require 'rails_helper'

RSpec.describe User, type: :model do
    let(:user) { User.new }

    # instantiation test
	it 'exists' do
		organization
	end

	# attribute tests
	it 'has a status' do
		expect(organization).to respond_to(:status)
	end
end
