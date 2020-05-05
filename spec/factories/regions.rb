FactoryBot.define do
    factory :region do
      name { 'fake_name' }
      #association :doer, factory: :ticket, name: "ticket doer"
    end
end