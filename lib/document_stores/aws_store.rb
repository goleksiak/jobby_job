class AwsStore < DocumentStore

  def store
    s3.put_object bucket: bucket,
                  key: @document.original_filename,
                  body: @file_contents
  end

  private

  def s3
    Aws::S3::Client.new region: ENV.fetch('AWS_REGION')
  end

  def bucket
    ENV.fetch('AWS_BUCKET')
  end
end
