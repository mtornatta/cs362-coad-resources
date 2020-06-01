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

  end

  context 'As a registered user' do

    let(:ticket) { create(:ticket) }
    let(:user) { create(:user) }

  end

  context 'As a public user' do

    let(:ticket) { create(:ticket) }

  end


end
