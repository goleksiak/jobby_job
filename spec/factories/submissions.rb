FactoryGirl.define do

  factory :submission do
    job nil
    name 'Name'
    email 'Email'
    phone_number '(843) 513-7341'

    trait :with_job do
      job
    end

    trait :with_cover_letter do
      cover_letter factory: :document_cover_letter_uploaded
    end

    trait :with_resume do
      resume factory: :document_resume_uploaded
    end

    factory :submission_with_job, traits: [:with_job]
    factory :submission_with_job_and_documents, traits: [ :with_job,
                                                          :with_cover_letter,
                                                          :with_resume]
  end
end
