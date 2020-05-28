FactoryBot.define do

  factory :organization do

  	sequence(:email) { |n| "organization#{n}@email.com" }
  	sequence(:name) { |n| "Organization #{n}" }
  	phone { '+14515555555' }
  	primary_name { 'FAKE' }
  	secondary_name { 'ORGANIZATION' }
  	secondary_phone { '+24515555555' }

   # Traits
   
  	trait :approved do
  		status { :approved }
  	end

  	trait :submitted do
  		status { :submitted }
  	end

  	trait :rejected do
  		status { :rejected }
  	end

  	trait :locked do
  		status { :locked }
  	end

  end

end