FactoryBot.define do

  factory :ticket do

  	sequence(:name) {|n| "Ticket#{n}"}
  	phone { "+14515555555" }
  	association :region, factory: :region
  	association :resource_category, factory: :resource_category

   # Traits

  	trait :open do
  		closed { false }
  	end

  	trait :closed do
  		closed { true }
  	end

  end

end