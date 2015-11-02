FactoryGirl.define do

  factory :document, aliases: [:document_cover_letter] do
    submission nil
    file ActionDispatch::Http::UploadedFile.new tempfile: File.open(File.join(Rails.root, 'spec/fixtures', 'cover_letter.txt')),
                                                filename: 'cover_letter.txt',
                                                type: 'text/plain'

    trait :resume do
      file ActionDispatch::Http::UploadedFile.new tempfile: File.open(File.join(Rails.root, 'spec/fixtures', 'resume.txt')),
                                                  filename: 'resume.txt',
                                                  type: 'text/plain'

    end

    trait :uploaded do
      public_url 'https://test.s3.amazonaws.com/document.txt'
    end

    factory :document_cover_letter_uploaded, traits: [:uploaded]
    factory :document_resume_uploaded, traits: [:resume, :uploaded]
  end
end
