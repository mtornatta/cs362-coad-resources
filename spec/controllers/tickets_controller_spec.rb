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

    describe 'POST #create' do
      before do
        admin.confirm
        sign_in(admin)
      end
      it 'redirects to ticket submitted page' do
        region = create(:region)
        resource_category = create(:resource_category)
        expect(
          post(
            :create,
            params: {
              ticket: {
                name: ticket.name,
                phone: ticket.phone,
                region_id: region.id,
                resource_category_id: resource_category.id
              }
            }
          )
        ).to redirect_to(ticket_submitted_path)
      end
    end

    describe 'GET #show' do
      before do
        admin.confirm
        sign_in(admin)
      end
      it 'is successful' do
        expect(
          get(
            :show, 
            params: { id: ticket.id }
        )
      ).to be_successful
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

    describe 'POST #release' do
      before do
        admin.confirm
        sign_in(admin)
      end
      it 'redirects to dashboard' do
        expect(
          post(
            :release,
            params: { id: ticket.id }
          )
        ).to redirect_to(dashboard_path)
      end
      it 'redirects to captured tickets if part of an org' do
        organization = create(:organization, :approved)
        organization.save
        admin.organization = organization
        admin.save
        expect(
          post(
            :release,
            params: { id: ticket.id }
          )
        ).to redirect_to(dashboard_path << '#tickets:captured')
      end
    end

  end


  context 'As a registered user' do

    let(:ticket) { create(:ticket) }
    let(:user) { create(:user) }

    describe 'GET #new' do
      before do
        user.confirm
        sign_in(user)
      end
      it 'is successful' do
        expect(get :new).to be_successful
      end
    end

    describe 'POST #create' do
      before do
        user.confirm
        sign_in(user)
      end
      it 'redirects to ticket submitted page' do
        region = create(:region)
        resource_category = create(:resource_category)
        expect(
          post(
            :create,
            params: {
              ticket: {
                name: ticket.name,
                phone: ticket.phone,
                region_id: region.id,
                resource_category_id: resource_category.id
              }
            }
          )
        ).to redirect_to(ticket_submitted_path)
      end
    end

    describe 'GET #show' do
      before do
        user.confirm
        sign_in(user)
      end
      it 'is successful' do
        organization = create(:organization, :approved)
        user.organization = organization
        user.save
        expect(
          get(
            :show, 
            params: { id: ticket.id }
        )
      ).to be_successful
      end
    end

    describe 'POST #capture' do
      before do
        user.confirm
        sign_in(user)
      end
      it 'redirects to open tickets' do
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

    describe 'POST #release' do
      before do
        user.confirm
        sign_in(user)
      end
      it 'redirects to organization\'s tickets' do
        organization = create(:organization, :approved)
        organization.save
        user.organization = organization
        user.save
        allow(TicketService).to receive(:release_ticket).and_return(:ok)
        expect(
          post(
            :release,
            params: { id: ticket.id }
          )
        ).to redirect_to(dashboard_path << '#tickets:organization')
      end
    end

  end


  context 'As a public user' do

    let(:ticket) { create(:ticket) }

    describe 'GET #new' do
      it 'is successful' do
        expect(get :new).to be_successful
      end
    end

    describe 'POST #create' do
      it 'redirects to ticket submitted page' do
        region = create(:region)
        resource_category = create(:resource_category)
        expect(
          post(
            :create,
            params: {
              ticket: {
                name: ticket.name,
                phone: ticket.phone,
                region_id: region.id,
                resource_category_id: resource_category.id
              }
            }
          )
        ).to redirect_to(ticket_submitted_path)
      end
    end

    # uncomment if show method is tweaked to deny
    # a public user:
    #
    # describe 'GET #show' do
    #   it 'is not successful' do
    #     expect(
    #       get(
    #         :show, 
    #         params: { id: ticket.id }
    #     )
    #   ).not_to be_successful
    #   end
    # end

    describe 'POST #capture' do
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

end
