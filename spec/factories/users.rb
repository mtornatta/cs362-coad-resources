FactoryBot.define do
	factory :user do
		trait :admin do
			role { :admin }
		end
		
		trait :organization_member do
			role { :organization }
		end
	end
end