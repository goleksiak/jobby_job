class Document < ActiveRecord::Base

  attr_accessor :file

  belongs_to :submission

  before_create :write_file_metadata
  after_create :store_file

  def storage_directory
    "document-#{id}"
  end

  private

  def write_file_metadata
    write_attribute :content_type, file.content_type
    write_attribute :original_filename, file.original_filename
  end

  def store_file
    DocumentStoreJob.perform_later self, file.read
  end
end
