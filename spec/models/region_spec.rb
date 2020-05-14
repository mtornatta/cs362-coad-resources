require 'rails_helper'

RSpec.describe Region, type: :model do
  #let(:region) { Region.new }
  let(:region) { FactoryBot.build(:region) }

    # instantiation test
  it 'exists' do
    region
  end

  # attribute tests
  it 'has a name' do
    expect(region).to respond_to(:name)
  end

  it 'validates presence of name' do
    expect(region).to validate_presence_of(:name)
  end

end
