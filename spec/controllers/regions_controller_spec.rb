require 'rails_helper'

RSpec.describe RegionsController, type: :controller do

  context 'Admin User' do

    let(:region) { create(:region) }
    let(:admin) { create(:user, :admin) }


    describe 'GET #index' do
      it 'returns list of all regions' do
        expect(controller.index).to include(region)
      end
    end


    describe 'GET #show' do
      it 'returns the specified region' do
        get :show, params: { id: region.id }
        expect(controller.show).to eq(region)
      end
    end


    describe 'GET #new' do
      it 'returns a brand new region' do
        new_region = controller.new
        expect(new_region).to be_an_instance_of(Region)
        expect(new_region).not_to be_valid
      end
    end


    describe 'POST #create' do
      before do
        admin.confirm
        sign_in(admin)
      end

      it 'creates a region' do
        expect{
          post(
            :create, 
            params: {
              region: attributes_for(:region)
            }
          )
        }.to change{
          Region.count
        }.by 1
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
      it 'returns the specified region' do
        get :edit, params: { id: region.id }
        expect(controller.edit).to eq(region)
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

      it 'deletes a region' do
        expect{
          delete(
            :destroy,
            params: { id: region.id }
          )
        }.to change {
          Region.count
        }.by 1
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

end
