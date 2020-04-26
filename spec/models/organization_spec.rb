require 'rails_helper'

RSpec.describe Organization, type: :model do
	
	let(:organization) { Organization.new }

	describe 'existence' do
		it 'exists' do
			organization
		end
	end

	describe 'attributes' do
		it 'responds to status' do
			expect(organization).to respond_to(:status)
		end

		it 'responds to transportation' do
			expect(organization).to respond_to(:transportation)
		end

		it 'responds to email' do
			expect(organization).to respond_to(:email)
		end

		it 'responds to name' do
			expect(organization).to respond_to(:name)
		end
		
		it 'responds to phone' do
			expect(organization).to respond_to(:phone)
		end

		it 'responds to primary name' do
			expect(organization).to respond_to(:primary_name)
		end
		
		it 'responds to secondary name' do
			expect(organization).to respond_to(:secondary_name)
		end
		
		it 'responds to secondary phone' do
			expect(organization).to respond_to(:secondary_phone)
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

end