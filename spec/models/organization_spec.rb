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

	describe 'validations' do

	end

end