require 'rails_helper'

RSpec.describe ResourceCategoriesController, type: :controller do

  context 'As an admin' do

    let(:recource_category) { create(:resource_category) }
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

    # uncomment if implemented:
    # 
    # describe 'GET #show' do
    #   before do
    #     admin.confirm
    #     sign_in(admin)
    #   end
    #   it 'is successful' do
    #     expect(get :show).to be_successful
    #   end
    # end

    describe 'GET #new' do
      before do
        admin.confirm
        sign_in(admin)
      end
      it 'is successful' do
      end
    end

    describe 'POST #create' do
      before do
        admin.confirm
        sign_in(admin)
      end
      it 'is successful' do
      end
    end

    # uncomment if implemented:
    # 
    # describe 'GET #edit' do
    #   before do
    #     admin.confirm
    #     sign_in(admin)
    #   end
    #   it 'is successful' do
    #     expect(get :edit).to be_successful
    #   end
    # end

    describe 'PATCH #update' do
      before do
        admin.confirm
        sign_in(admin)
      end
      it 'is successful' do
      end
    end

    describe 'PATCH #activate' do
      before do
        admin.confirm
        sign_in(admin)
      end
      it 'is successful' do
      end
    end

    describe 'PATCH #deactivate' do
      before do
        admin.confirm
        sign_in(admin)
      end
      it 'is successful' do
      end
    end

    describe 'DELETE #destroy' do
      before do
        admin.confirm
        sign_in(admin)
      end
      it 'is successful' do
      end
    end

  end



context 'As a registered user' do

    let(:recource_category) { create(:resource_category) }
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

    # uncomment if implemented:
    # 
    # describe 'GET #show' do
    #   before do
    #     user.confirm
    #     sign_in(user)
    #   end
    #   it 'is not successful' do
    #     expect(get :show).not_to be_successful
    #   end
    # end

    describe 'GET #new' do
      before do
        user.confirm
        sign_in(user)
      end
      it 'is not successful' do
      end
    end

    describe 'POST #create' do
      before do
        user.confirm
        sign_in(user)
      end
      it 'is not successful' do
      end
    end

    # uncomment if implemented:
    # 
    # describe 'GET #edit' do
    #   before do
    #     user.confirm
    #     sign_in(user)
    #   end
    #   it 'is not successful' do
    #     expect(get :show).not_to be_successful
    #   end
    # end

    describe 'PATCH #update' do
      before do
        user.confirm
        sign_in(user)
      end
      it 'is not successful' do
      end
    end

    describe 'PATCH #activate' do
      before do
        user.confirm
        sign_in(user)
      end
      it 'is not successful' do
      end
    end

    describe 'PATCH #deactivate' do
      before do
        user.confirm
        sign_in(user)
      end
      it 'is not successful' do
      end
    end

    describe 'DELETE #destroy' do
      before do
        user.confirm
        sign_in(user)
      end
      it 'is not successful' do
      end
    end

  end



  context 'As a public user' do

    let(:recource_category) { create(:resource_category) }

    describe 'GET #index' do
      it 'is not successful' do
        expect(get :index).not_to be_successful
      end
    end

    # uncomment if implemented:
    # 
    # describe 'GET #show' do
    #   it 'is not successful' do
    #     expect(get :show).not_to be_successful
    #   end
    # end

    describe 'GET #new' do
      it 'is not successful' do
      end
    end

    describe 'POST #create' do
      it 'is not successful' do
      end
    end

    # uncomment if implemented:
    # 
    # describe 'GET #edit' do
    #   it 'is not successful' do
    #     expect(get :show).not_to be_successful
    #   end
    # end

    describe 'PATCH #update' do
      it 'is not successful' do
      end
    end

    describe 'PATCH #activate' do
      it 'is not successful' do
      end
    end

    describe 'PATCH #deactivate' do
      it 'is not successful' do
      end
    end

    describe 'DELETE #destroy' do
      it 'is not successful' do
      end
    end

  end

end
