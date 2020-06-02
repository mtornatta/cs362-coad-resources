require 'rails_helper'

RSpec.describe TicketsController, type: :controller do

  context 'As an admin' do

    let(:ticket) { create(:ticket) }
    let(:admin) { create(:user, :admin) }
    
    describe 'GET #new' do
      before do
        admin.confirm
        sign_in(admin)
      end
      it 'is successful' do
        expect(get :new).to be_successful
      end
    end

    describe 'POST #capture' do
      before do
        admin.confirm
        sign_in(admin)
      end
      it 'redirects to dashboard' do
        expect(
          post(
            :capture,
            params: { id: ticket.id }
          )
        ).to redirect_to(dashboard_path)
      end
    end

  end

  context 'As a registered user' do

    let(:ticket) { create(:ticket) }
    let(:user) { create(:user) }

    describe 'POST #capture' do
      before do
        user.confirm
        sign_in(user)
      end
      it 'redirects to dashboard' do
        organization = create(:organization, :approved)
        organization.save
        user.organization = organization
        user.save
        expect(
          post(
            :capture,
            params: { id: ticket.id }
          )
        ).to redirect_to(dashboard_path << '#tickets:open')
      end
    end

  end

  context 'As a public user' do

    let(:ticket) { create(:ticket) }

  end

end
