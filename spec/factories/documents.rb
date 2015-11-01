FactoryGirl.define do

  factory :document do
    submission nil
    location 'http://s3.amazon.com'
    file ActionDispatch::Http::UploadedFile.new tempfile: File.join(Rails.root, 'spec/fixtures', 'cover_letter.txt'),
                                                filename: 'cover_letter.txt',
                                                type: 'text/plain'
  end
end
