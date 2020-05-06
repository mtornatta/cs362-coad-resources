require 'rails_helper'

RSpec.describe User, type: :model do

    #let(:user) { User.new }
    let(:user) { FactoryBot.build(:user) }

    #instantiation test
	it 'exists' do
		user
	end

	#attribute tests
	it 'has an email' do
		expect(user).to respond_to(:email)
	end


	describe 'validation tests' do

		it 'validates presence of an email' do
			expect(user).to validate_presence_of(:email)
		end

		it 'validates length of email' do
			expect(user).to validate_length_of(:email).is_at_least(1).is_at_most(255)
		end

		it 'validates email is case insensitive' do
			expect(user).to validate_uniqueness_of(:email).case_insensitive
		end

	end

	describe 'user role tests' do

		it 'assigns organization role by default' do
			expect(user.role).to eq('organization')
		end

		it 'can assign admin role to user' do
			user = FactoryBot.build(:user, role: 'admin')
			expect(user.role).to eq('admin')
		end

	end



end
