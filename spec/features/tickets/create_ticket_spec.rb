require 'rails_helper'

RSpec.describe 'Creating a Ticket', type: :feature do
	visit root_path
  click_link 'Get Help'
  fill_in 'Full Name', with: 'fake name'
  fill_in 'Phone Number', with: 'etc.'
  # select 'Bend', from: 'Region'
  # select ''

end
