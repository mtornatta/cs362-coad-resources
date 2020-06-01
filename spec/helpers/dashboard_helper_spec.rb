require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the DashboardHelper. For example:
#
# describe DashboardHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe DashboardHelper, type: :helper do

  it 'returns admin dashboard' do
    admin = double()
    allow(admin).to receive(:admin?).and_return(true)
    expect(dashboard_for(admin)).to eq('admin_dashboard')
  end

  it 'returns org submitted dashboard' do
    user = double()
    allow(user).to receive(:admin?).and_return(false)
    allow(user).to receive_message_chain(:organization, :submitted?).and_return(true)
    expect(dashboard_for(user)).to eq('organization_submitted_dashboard')
  end

  it 'returns org approved dashboard' do
    user = double()
    allow(user).to receive(:admin?).and_return(false)
    allow(user).to receive_message_chain(:organization, :submitted?).and_return(false)
    allow(user).to receive_message_chain(:organization, :approved?).and_return(true)
    expect(dashboard_for(user)).to eq('organization_approved_dashboard')
  end

  it 'returns create application dashboard' do
    user = double()
    allow(user).to receive(:admin?).and_return(false)
    allow(user).to receive_message_chain(:organization, :submitted?).and_return(false)
    allow(user).to receive_message_chain(:organization, :approved?).and_return(false)
    expect(dashboard_for(user)).to eq('create_application_dashboard')
  end

end
