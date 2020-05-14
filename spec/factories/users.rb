FactoryBot.define do

  factory :user do

  	email { 'fake@fake.com'}
  	password { 'fake_password' }

  	trait :admin do
  	  role { :admin }
  	end
    
  	trait :organization_member do
  	  role { :organization }
  	end

  end

end