require 'rails_helper'

RSpec.describe User, type: :model do
    let(:user) { User.new }

    # instantiation test
	it 'exists' do
		user
	end

	# attribute tests
	it 'has an email' do
		expect(user).to respond_to(:email)
	end
end
