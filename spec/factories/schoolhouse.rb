FactoryGirl.define do
	factory :schoolhouse, class: Schoolhouse do
		name 'Orrington'
		level 'Elementary'

		trait :large do
			enrollment 2500
		end

		trait :medium do
			enrollment 1000
		end

		trait :small do
			enrollment 500
		end
	end
end