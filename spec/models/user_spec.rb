require 'rails_helper'

RSpec.describe User, type: :model do

  # Stub Builds
  let(:user) { build(:user) }
  let(:organization_member) { build(:user, :organization_member) }
  let(:admin) { build(:user, :admin) }


  describe 'Validation Tests' do

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


  describe 'User Role Tests' do

  	it 'can assign organization role' do
  	  expect(organization_member.role).to eq('organization')
  	end

  	it 'can assign admin role' do
  	  expect(admin.role).to eq('admin')
  	end

  end


  describe 'Method Tests' do

    #set_default_role
    it 'sets default role to organization' do
      expect(user.role).to eq('organization')
    end

    #to_s 
    it 'is represented by its email' do
      expect(user.to_s).to eq(user.email)
    end

  end


end
