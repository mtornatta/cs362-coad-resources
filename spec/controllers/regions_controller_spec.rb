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

      it 'redirects after creation' do
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

      it 'confirms updates to a region' do
        expect(
          patch(
            :update, 
            params: {
              id: region.id,
              region: attributes_for(:region)
            }
          )
        ).to redirect_to("/regions/#{region.id}")
      end
    end


    describe 'DELETE #destroy' do
      before do
        admin.confirm
        sign_in(admin)
      end

      it 'redirects after deletion' do
        expect(
          delete(
            :destroy,
            params: { id: region.id }
          )
        ).to redirect_to(regions_path)
      end
    end

  end


  context 'As a regular user' do

    let(:user) { create(:user) }

  end

end
