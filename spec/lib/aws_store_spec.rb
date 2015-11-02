require 'rails_helper'

RSpec.describe AwsStore do

  include ActiveJob::TestHelper

  describe '#store', stub: :amazon_s3 do

    before { perform_enqueued_jobs { create :document } }

    it 'should send a request to S3' do
      expect(a_request(:put, %r{s3.amazonaws.com})).to have_been_made.once
    end
  end
end
