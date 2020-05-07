require 'rails_helper'

RSpec.describe Organization, type: :model do
	
	let(:organization) { Organization.new }

	describe 'attributes' do

		it 'responds to transportation' do
			expect(organization).to respond_to(:transportation)
		end

	end

	describe 'presence-of validations' do

		it 'validates presence of email' do
			expect(organization).to validate_presence_of(:email)
		end

		it 'validates presence of name' do
			expect(organization).to validate_presence_of(:name)
		end

		it 'validates presence of phone' do
			expect(organization).to validate_presence_of(:phone)
		end

		it 'validates presence of status' do
			expect(organization).to validate_presence_of(:status)
		end

		it 'validates presence of primary name' do
			expect(organization).to validate_presence_of(:primary_name)
		end

		it 'validates presence of secondary name' do
			expect(organization).to validate_presence_of(:secondary_name)
		end
		
		it 'validates presence of secondary phone' do
			expect(organization).to validate_presence_of(:secondary_phone)
		end

		# it 'should fail' do
		# 	expect(organization).to validate_presence_of(:transportation)
		# end
		
	end

	describe 'length validations' do
		it 'validates length of email' do

		end
	end

	describe 'associations' do

		it 'has many users' do
			expect(organization).to have_many(:users)
		end

		it 'has many tickets' do
			expect(organization).to have_many(:tickets)
		end
		
		it 'belongs to and has many resource categories' do
			expect(organization).to have_and_belong_to_many(:resource_categories)
		end

	end

end