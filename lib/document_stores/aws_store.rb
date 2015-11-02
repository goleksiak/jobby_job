class AwsStore < DocumentStore

  def store
    s3_client.put_object  bucket: bucket,
                          key: key,
                          body: @file_contents

    @document.update_attribute :public_url, public_url
  end

  private

  def public_url
    s3_resource.bucket(bucket).object(key).public_url
  end

  def key
    @document.original_filename
  end

  def s3_resource
    Aws::S3::Resource.new region: ENV.fetch('AWS_REGION')
  end

  def s3_client
    Aws::S3::Client.new region: ENV.fetch('AWS_REGION')
  end

  def bucket
    ENV.fetch('AWS_BUCKET')
  end
end
