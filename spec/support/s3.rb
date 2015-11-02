RSpec.configure do |config|

  config.before(:each, stub: :amazon_s3) do
    stub_request(:put, %r{test.s3.amazonaws.com}).to_return(status: 200)
  end
end
