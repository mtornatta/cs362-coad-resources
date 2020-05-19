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

	trait :organization do
		closed { false }
		organization_id { "organization_id" }
	end

	trait :closed_organization do
		closed { true }
		organization_id { "organization_id" }
	end

	trait :region do
		region_id { "1" }
	end

	trait :resource_category do
		resource_category_id { "1" }
	end

  end

end