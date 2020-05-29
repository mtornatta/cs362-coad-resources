require 'rails_helper'

RSpec.describe RegionsController, type: :controller do

  context 'Admin User' do
    describe 'POST #create' do
      let(:user) { create(:user, :admin) }
      before do
        user.confirm
        sign_in(user)
      end

      it 'succeeds' do
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

    describe 'GET #index' do
      let(:region) { create(:region) }
      before do
        region
      end
      it 'succeeds' do
        expect(controller.index).to include(region)
      end
    end
    
    describe 'PATCH #update' do
      let(:region) { create(:region) }
      let(:user) { create(:user, :admin) }
      before do
        user.confirm
        sign_in(user)
      end

      it 'succeeds' do
        expect(
          patch(
            :create, 
            params: {
              region: attributes_for(:region)
            } 
          )
        ).to redirect_to("/regions/#{region.id}")
      end
    end

  end

end
