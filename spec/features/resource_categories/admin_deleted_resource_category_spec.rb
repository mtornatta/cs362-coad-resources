require 'rails_helper'

RSpec.describe 'Deleting a Resource Category', type: :feature do
    it 'successfully' do
        resource_category = create(:resource_category)
        admin = create(:user,:admin)
        admin.confirm
        log_in_as(admin)
        visit resource_categories_path(resource_category.id)
        byebug
        click_on('Delete')
        accept_confirm do
            click_link 'OK'
        end
        expect(current_path).to eq(dashboard_path)
    end
end
