require 'rails_helper'

RSpec.describe RegionsController, type: :controller do

  context 'Admin User' do
    let(:region) { create(:region) }

    describe 'GET #index' do

      it 'returns list of all regions' do
        expect(controller.index).to include(region)
      end
    end

    describe 'GET #show' do
      let(:region) { create(:region) }

      it 'finds the specified region' do
        get :show, params: { id: region.id }
        expect(controller.show).to eq(region)
      end
    end


    describe 'GET #new' do
    end


    describe 'POST #create' do
      let(:user) { create(:user, :admin) }

      before do
        user.confirm
        sign_in(user)
      end

      it 'creates a region' do
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
    end

    
    describe 'PATCH #update' do
      let(:user) { create(:user, :admin) }

      before do
        user.confirm
        sign_in(user)
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
    end

  end

end
