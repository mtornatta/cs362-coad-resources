require 'rails_helper'

RSpec.describe RegionsController, type: :controller do

  context 'As an admin' do

    let(:region) { create(:region) }
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

    describe 'GET #show' do
      before do
        admin.confirm
        sign_in(admin)
      end
      it 'is successful' do
        expect(
          get( 
            :show, 
            params: { id: region.id }
          )
        ).to be_successful
      end
    end

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
      it 'redirects to regions' do
        expect(
          post(
            :create, 
            params: {
              region: attributes_for(:region)
            }
          )
        ).to redirect_to(regions_path)
      end
    end

    describe 'GET #edit' do
      before do
        admin.confirm
        sign_in(admin)
      end
      it 'is successful' do
        expect(
          get(
            :edit, 
            params: { id: region.id }
          )
        ).to be_successful
      end
    end
    
    describe 'PATCH #update' do
      before do
        admin.confirm
        sign_in(admin)
      end
      it 'redirects to the updated region' do
        expect(
          patch(
            :update, 
            params: {
              id: region.id,
              region: attributes_for(:region)
            }
          )
        ).to redirect_to(region_path(region.id))
      end
    end

    describe 'DELETE #destroy' do
      before do
        admin.confirm
        sign_in(admin)
      end
      it 'redirects to regions' do
        expect(
          delete(
            :destroy,
            params: { id: region.id }
          )
        ).to redirect_to(regions_path)
      end
    end

  end



  context 'As a registered user' do

    let(:region) { create(:region) }
    let(:user) { create(:user) }

    describe 'GET #index' do
      before do
        user.confirm
        sign_in(user)
      end
      it 'is not successful' do
        expect(get :index).not_to be_successful
      end
    end

    describe 'GET #show' do
      before do
        user.confirm
        sign_in(user)
      end
      it 'is not successful' do
        expect(
          get( 
            :show, 
            params: { id: region.id }
          )
        ).not_to be_successful
      end
    end

    describe 'GET #new' do
      before do
        user.confirm
        sign_in(user)
      end
      it 'is not successful' do
        expect(get :new).not_to be_successful
      end
    end

    describe 'POST #create' do
      before do
        user.confirm
        sign_in(user)
      end
      it 'redirects to dashboard after creation' do
        expect(
          post(
            :create, 
            params: {
              region: attributes_for(:region)
            }
          )
        ).to redirect_to(dashboard_path)
      end
    end

    describe 'GET #edit' do
      before do
        user.confirm
        sign_in(user)
      end
      it 'is not successful' do
        expect(
          get(
            :edit, 
            params: { id: region.id }
          )
        ).not_to be_successful
      end
    end

    describe 'PATCH #update' do
      before do
        user.confirm
        sign_in(user)
      end
      it 'redirects to dashboard' do
        expect(
          patch(
            :update, 
            params: {
              id: region.id,
              region: attributes_for(:region)
            }
          )
        ).to redirect_to(dashboard_path)
      end
    end

    describe 'DELETE #destroy' do
      before do
        user.confirm
        sign_in(user)
      end
      it 'redirects to dashboard' do
        expect(
          delete(
            :destroy,
            params: { id: region.id }
          )
        ).to redirect_to(dashboard_path)
      end
    end

  end



  context 'As a public user' do

    let(:region) { create(:region) }

    describe 'GET #index' do
      it 'is not successful' do
        expect(get :index).not_to be_successful
      end
    end
    
    describe 'GET #show' do
      it 'is not successful' do
        expect(
          get( 
            :show, 
            params: { id: region.id }
          )
        ).not_to be_successful
      end
    end
    
    describe 'GET #new' do
      it 'is not successful' do
        expect(get :new).not_to be_successful
      end
    end
    
    describe 'POST #create' do
      it 'redirects to login page after creation' do
        expect(
          post(
            :create, 
            params: {
              region: attributes_for(:region)
            }
          )
        ).to redirect_to(user_session_path)
      end
    end
    
    describe 'GET #edit' do
      it 'is not successful' do
        expect(
          get(
            :edit, 
            params: { id: region.id }
          )
        ).not_to be_successful
      end
    end
    
    describe 'PATCH #update' do
      it 'redirects to login page' do
        expect(
          patch(
            :update, 
            params: {
              id: region.id,
              region: attributes_for(:region)
            }
          )
        ).to redirect_to(user_session_path)
      end
    end
    
    describe 'DELETE #destroy' do
      it 'redirects to login page' do
        expect(
          delete(
            :destroy,
            params: { id: region.id }
          )
        ).to redirect_to(user_session_path)
      end
    end

  end

end