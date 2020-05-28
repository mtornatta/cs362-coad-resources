FactoryBot.define do

  factory :user do

  	email { 'fake@email.com'}
  	password { 'password' }

   # Traits

  	trait :admin do
  	  role { :admin }
      sequence(:email) { |n| "admin#{n}@email.com" }
  	end

  	trait :organization_member do
  	  role { :organization }
      sequence(:email) { |n| "user#{n}@email.com" }
  	end

  end

end