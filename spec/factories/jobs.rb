FactoryGirl.define do

  factory :job do
    title 'Job Title'
    description 'Job description'

    trait :with_submissions do
      after :create do |job, evaluator|
        create_list :submission_with_job_and_documents, 3, job: job
      end
    end

    factory :job_with_submissions, traits: [:with_submissions]
  end
end
