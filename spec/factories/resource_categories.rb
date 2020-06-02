FactoryBot.define do

  factory :resource_category do

    sequence(:name) { |n| "Resource Category #{n}" }
    active { true }

    # Traits

    trait :inactive do
      active { false }
    end

    trait :unspecified do
      name { 'Unspecified' }
    end
    
  end

end