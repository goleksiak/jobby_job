FactoryGirl.define do

  sequence :email do |n|
    "user#{n}@example.com"
  end

  factory :user do
    email
    password 'password'

    trait :admin do
      admin true
    end

    factory :user_admin, traits: [:admin]
  end
end
