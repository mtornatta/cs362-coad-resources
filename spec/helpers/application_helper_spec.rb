require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do

  let(:base_title) { 'Disaster Resource Network' }

  it 'returns base title with no parameters' do
    expect(full_title).to eq(base_title)
  end

  it 'returns base title | page title when passed' do
    page_title = 'Test Page Title'
    expect(full_title(page_title)).to eq("#{page_title} | #{base_title}")
  end

end
