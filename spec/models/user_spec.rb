require 'rails_helper'

RSpec.describe User, type: :model do
    user = User.new
    specify{expect(user.role).to eq("organization")}
    specify{expect(user.email).to eq("")}
    # test for password?
end
