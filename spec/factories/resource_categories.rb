FactoryBot.define do

  factory :resource_category do

    sequence(:name) { |n| "Resource_Category#{n}" }

    # Traits

    trait :unspecified do
      name { 'Unspecified' }
    end
    
  end

end