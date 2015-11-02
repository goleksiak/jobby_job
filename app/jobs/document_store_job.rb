class DocumentStoreJob < ActiveJob::Base

  queue_as :document_store

  def perform(document, file_contents)
    case ENV.fetch('DOCUMENT_STORE')
    when 'aws'
      AwsStore.new(document, file_contents).store
    when 'other'
      # Other DocumentStore
    end
  end
end
