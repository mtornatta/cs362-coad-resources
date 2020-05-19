require 'rails_helper'

RSpec.describe User, type: :model do

  # Stub Builds
  let(:user) { build(:user) }
  let(:organization_member) { build(:user, :organization_member) }
  let(:admin) { build(:user, :admin) }


  describe 'User Role Tests' do

    it 'can assign organization role' do
      expect(organization_member.role).to eq('organization')
    end

    it 'can assign admin role' do
      expect(admin.role).to eq('admin')
    end

  end


  describe 'Association Tests' do

    it 'can belong to an organization' do
      expect(user).to belong_to('organization').optional
    end

  end


  describe 'Validation Tests' do

    describe 'Presence-of' do

      it 'must have an email' do
    	  expect(user).to validate_presence_of(:email)
      end

      it 'must have a password in database' do
        expect(user).to validate_presence_of(:password).on(:create)
      end

    end

    describe 'Length' do

      it 'has a valid length email' do
    	  expect(user).to validate_length_of(:email).is_at_least(1).is_at_most(255).on(:create)
      end

      it 'has a valid length password' do
        expect(user).to validate_length_of(:password).is_at_least(7).is_at_most(255).on(:create)
      end

    end

    describe 'Format' do
      
      it 'has a valid email' do
        valid_email = "test@email.com"
        invalid_email = "invalid_email.com"
        expect(user).to allow_value(valid_email).for(:email)
        expect(user).not_to allow_value(invalid_email).for(:email)
      end
      
    end

    describe 'Uniqueness' do

      it 'has a unique email (case insensitive)' do
    	  expect(user).to validate_uniqueness_of(:email).case_insensitive
      end

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
