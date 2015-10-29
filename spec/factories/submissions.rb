FactoryGirl.define do

  factory :submission do
    job nil
    name 'Name'
    email 'Email'
    phone_number '(843) 513-7341'

    trait :with_job do
      job
    end

    factory :submission_with_job, traits: [:with_job]
  end
end
