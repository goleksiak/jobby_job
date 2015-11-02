require 'rails_helper'

RSpec.describe AwsStore do

  include ActiveJob::TestHelper

  describe '#store', stub: :amazon_s3 do

    let(:document) { build :document }

    before { perform_enqueued_jobs { document.save } }

    it 'should send a request to S3' do
      expect(a_request(:put, %r{test.s3.amazonaws.com})).to have_been_made.once
    end

    it 'should update the Document public_url' do
      expect(document.reload.public_url).to eq('https://test.s3.amazonaws.com/cover_letter.txt')
    end
  end
end
