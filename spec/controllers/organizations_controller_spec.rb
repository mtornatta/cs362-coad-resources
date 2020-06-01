require 'rails_helper'

RSpec.describe OrganizationsController, type: :controller do

  context 'As an admin' do

    let(:admin) { create(:user, :admin) }

    describe 'GET #index' do
      before do
        admin.confirm
        sign_in(admin)
      end
      it 'is successful' do
        expect(get :index).to be_successful
      end
    end

    describe 'GET #new' do
      before do
        admin.confirm
        sign_in(admin)
      end
      it 'is not successful' do
        expect(get :new).not_to be_successful
      end
    end

    describe 'POST #create' do
      before do
        admin.confirm
        sign_in(admin)
      end
      it 'redirects to dashboard path' do
        expect(
          post(
            :create,
            params: {
              organization: attributes_for(:organization)
            }
          )
        ).to redirect_to(dashboard_path)
      end
    end

    describe 'PATCH #update' do
      before do
        admin.confirm
        sign_in(admin)
      end
      it 'redirects to the updated organization' do
        organization = create(:organization)
        expect(
          patch(
            :update,
            params: {
              id: organization.id,
              organization: attributes_for(:organization)
            }
          )
        ).to redirect_to(organization_path(organization.id))
      end
    end

    describe 'PATCH #approve' do
      before do
        admin.confirm
        sign_in(admin)
      end
      it 'redirects to organizations' do
        organization = create(:organization)
        expect(
          patch(
            :approve,
            params: {
              id: organization.id
            }
          )
        ).to redirect_to(organizations_path)
      end
    end

    describe 'PATCH #reject' do
      before do
        admin.confirm
        sign_in(admin)
      end
      it 'redirects to organizations' do
        organization = create(:organization)
        expect(
          patch(
            :approve,
            params: {
              id: organization.id
            }
          )
        ).to redirect_to(organizations_path)
      end
    end

  end


  context 'As a registered user' do
    let(:user) { create(:user) }

    describe 'GET #index' do
      before do
        user.confirm
        sign_in(user)
      end
      it 'is successful' do
        expect(get :index).to be_successful
      end
    end

    describe 'GET #new' do
      before do
        user.confirm
        sign_in(user)
      end
      it 'is successful' do
        expect(get :new).to be_successful
      end
    end

    class FakeMailer
      def new_organization_application
        false
      end
    end
    describe 'POST #create' do
      before do
        user.confirm
        sign_in(user)
      end
      it 'redirects to submitted application page' do
        allow(UserMailer).to receive(:with).and_return(FakeMailer.new)
        expect(
          post(
            :create,
            params: {
              organization: attributes_for(:organization)
            }
          )
        ).to redirect_to(organization_application_submitted_path)
      end
    end

    describe 'PATCH #update' do
      before do
        user.confirm
        sign_in(user)
      end
      it 'redirects to updated organization' do
        organization = create(:organization, :approved)
        user.organization = organization
        user.save
        expect(
          patch(
            :update,
            params: {
              id: organization.id,
              organization: attributes_for(:organization)
            }
          )
        ).to redirect_to(organization_path(organization.id))
      end
    end

    describe 'PATCH #approve' do
      before do
        user.confirm
        sign_in(user)
      end
      it 'redirects to dashboard' do
        organization = create(:organization)
        expect(
          patch(
            :approve,
            params: { id: organization.id }
          )
        ).to redirect_to(dashboard_path)
      end
    end

    describe 'PATCH #reject' do
      before do
        user.confirm
        sign_in(user)
      end
      it 'redirects to dashboard' do
        organization = create(:organization)
        expect(
          patch(
            :reject,
            params: { id: organization.id }
          )
        ).to redirect_to(dashboard_path)
      end
    end

  end


  context 'As a public user' do

    describe 'GET #index' do
      it 'is not successful' do
        expect(get :index).not_to be_successful
      end
    end

    describe 'GET #new' do
      it 'is not successful' do
        expect(get :new).not_to be_successful
      end
    end

    describe 'POST #create' do
      it 'redirects to login page' do
        expect(
          post(
            :create,
            params: {
              organization: attributes_for(:organization)
            }
          )
        ).to redirect_to(user_session_path)
      end
    end

    describe 'PATCH #update' do
      it 'redirects to login page' do
        organization = create(:organization, :approved)
        expect(
          post(
            :create,
            params: {
              id: organization.id,
              organization: attributes_for(:organization)
            }
          )
        ).to redirect_to(user_session_path)
      end
    end

    describe 'PATCH #approve' do
      it 'redirects to login page' do
        organization = create(:organization)
        expect(
          patch(
            :approve,
            params: { id: organization.id }
          )
        ).to redirect_to(user_session_path)
      end
    end

    describe 'PATCH #reject' do
      it 'redirects to login page' do
        organization = create(:organization)
        expect(
          patch(
            :reject,
            params: { id: organization.id }
          )
        ).to redirect_to(user_session_path)
      end
    end

  end

end
