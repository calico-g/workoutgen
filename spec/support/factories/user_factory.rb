FactoryGirl.define do
	factory :user do
		sequence(:email) { |n| "user#{n}@ticketee.com" }
		password "password"
		password_confirmation "password"
	end

	factory :confirmed_user do
    after_create { |user| user.confirm! }
  end
end


