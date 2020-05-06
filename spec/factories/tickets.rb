FactoryBot.define do
	factory :ticket do
		association :place, factory: :region, strategy: :create
	end
end