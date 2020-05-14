FactoryBot.define do

  factory :resource_category do

    sequence(:name) { |n| "Resource_Category#{n}" }
    
  end

end