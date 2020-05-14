FactoryBot.define do

  factory :organization do

  	email { 'fake@email.com' }
  	name { 'FAKE ORGANIZATION' }
  	phone { '+14515555555' }
  	status { :approved }
  	primary_name { 'FAKE' }
  	secondary_name { 'ORGANIZATION' }
  	secondary_phone { '+34515555555' }
    
  end

end