FactoryBot.define do

  factory :user do

  	email { 'fake@email.com'}
  	password { 'password' }

   # Traits

  	trait :admin do
      sequence(:email) { |n| "admin#{n}@email.com" }
  	  role { :admin }
  	end

  	trait :organization_member do
      sequence(:email) { |n| "user#{n}@email.com" }
  	  role { :organization }
  	end

  end

end