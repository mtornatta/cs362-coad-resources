FactoryBot.define do

  factory :organization do

  	email { 'fake@email.com' }
  	name { 'FAKE ORGANIZATION' }
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