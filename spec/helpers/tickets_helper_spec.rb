require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the TIcketsHelper. For example:
#
# describe TIcketsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe TicketsHelper, type: :helper do
    let (:formatted_phone) { "+15444355374" }
    let (:un_formatted_phone) { "544.435.5374" }

    it 'formats a phone number correctly' do
        expect(format_phone_number(un_formatted_phone)).to eq(formatted_phone)
    end
end
