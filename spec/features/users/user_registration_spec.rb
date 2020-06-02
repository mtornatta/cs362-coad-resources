require 'rails_helper'

RSpec.describe 'User registration', type: :feature do

  let(:user_stub) { build(:user) }

  it 'displays success message' do
    visit signup_path
    fill_in 'Email', with: user_stub.email
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    user = User.find_by(email: user_stub.email)
    visit user_confirmation_path(confirmation_token: user.confirmation_token)
    expect(page).to have_content('successful')
  end

end
