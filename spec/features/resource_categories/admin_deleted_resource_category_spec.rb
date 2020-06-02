require 'rails_helper'

RSpec.describe 'Deleting a Resource Category', type: :feature do
    it 'successfully' do
        resource_category = create(:resource_category)
        admin = create(:user,:admin)
        admin.confirm
        log_in_as(admin)
        visit resource_category_path(resource_category.id)
        click_on('Delete')
        expect(page).to have_content('deleted')
    end
end
