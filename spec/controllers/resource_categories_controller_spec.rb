require 'rails_helper'

RSpec.describe ResourceCategoriesController, type: :controller do

  context 'As an admin' do

    let(:resource_category) { create(:resource_category) }
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
        expect(get :new).to be_successful
      end
    end

    describe 'POST #create' do
      before do
        admin.confirm
        sign_in(admin)
      end
      it 'redirects to recource categories' do
        expect(
          post(
            :create,
            params: {
              resource_category: attributes_for(:resource_category)
            }
          )
        ).to redirect_to(resource_categories_path)
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
      it 'redirects to the updated resource category' do
        expect(
          patch(
            :update,
            params: {
              id: resource_category.id,
              resource_category: attributes_for(:resource_category)
            }
          )
        ).to redirect_to(resource_category_path(resource_category))
      end
    end

    describe 'PATCH #activate' do
      before do
        admin.confirm
        sign_in(admin)
      end
      it 'redirects to activated resource category' do
        expect(
          patch(
            :activate,
            params: { id: resource_category.id }
          )
        ).to redirect_to(resource_category_path(resource_category))
      end
    end

    describe 'PATCH #deactivate' do
      before do
        admin.confirm
        sign_in(admin)
      end
      it 'redirects to deactivated resource category' do
        expect(
          patch(
            :deactivate,
            params: { id: resource_category.id }
          )
        ).to redirect_to(resource_category_path(resource_category))
      end
    end

    describe 'DELETE #destroy' do
      before do
        admin.confirm
        sign_in(admin)
      end
      it 'redirects to resource categories' do
        expect(
          patch(
            :destroy,
            params: { id: resource_category.id }
          )
        ).to redirect_to(resource_categories_path)
      end
    end

  end



context 'As a registered user' do

    let(:resource_category) { create(:resource_category) }
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
        expect(get :new).not_to be_successful
      end
    end

    describe 'POST #create' do
      before do
        user.confirm
        sign_in(user)
      end
      it 'redirects to dashboard' do
        expect(
          post(
            :create,
            params: {
              resource_category: attributes_for(:resource_category)
            }
          )
        ).to redirect_to(dashboard_path)
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
      it 'redirects to dashboard' do
        expect(
          patch(
            :update,
            params: {
              id: resource_category.id,
              resource_category: attributes_for(:resource_category)
            }
          )
        ).to redirect_to(dashboard_path)
      end 
    end

    describe 'PATCH #activate' do
      before do
        user.confirm
        sign_in(user)
      end
      it 'redirects to dashboard' do
        expect(
          patch(
            :activate,
            params: { id: resource_category.id }
          )
        ).to redirect_to(dashboard_path)
      end
    end

    describe 'PATCH #deactivate' do
      before do
        user.confirm
        sign_in(user)
      end
      it 'redirects to dashboard' do
        expect(
          patch(
            :deactivate,
            params: { id: resource_category.id }
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
          patch(
            :destroy,
            params: { id: resource_category.id }
          )
        ).to redirect_to(dashboard_path)
      end
    end

  end



  context 'As a public user' do

    let(:resource_category) { create(:resource_category) }

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
        expect(get :new).not_to be_successful
      end
    end

    describe 'POST #create' do
      it 'redirects to dashboard' do
        expect(
          post(
            :create,
            params: {
              resource_category: attributes_for(:resource_category)
            }
          )
        ).to redirect_to(user_session_path)
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
      it 'redirects to login page' do
        expect(
          patch(
            :update,
            params: {
              id: resource_category.id,
              resource_category: attributes_for(:resource_category)
            }
          )
        ).to redirect_to(user_session_path)
      end 
    end

    describe 'PATCH #activate' do
      it 'redirects to login page' do
        expect(
          patch(
            :activate,
            params: { id: resource_category.id }
          )
        ).to redirect_to(user_session_path)
      end
    end

    describe 'PATCH #deactivate' do
      it 'redirects to login page' do
        expect(
          patch(
            :deactivate,
            params: { id: resource_category.id }
          )
        ).to redirect_to(user_session_path)
      end
    end

    describe 'DELETE #destroy' do
      it 'redirects to login page' do
        expect(
          patch(
            :destroy,
            params: { id: resource_category.id }
          )
        ).to redirect_to(user_session_path)
      end
    end

  end

end
