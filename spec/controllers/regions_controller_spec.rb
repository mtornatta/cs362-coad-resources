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
            params: attributes_for(:region) 
          )
        ).to redirect_to(regions_path)
      end
    end
  end

end
