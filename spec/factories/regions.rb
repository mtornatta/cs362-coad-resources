FactoryBot.define do

  factory :region, aliases: [:place] do

    sequence(:name) { |n| "Region#{n}" }
    
  end

end