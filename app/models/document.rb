class Document < ActiveRecord::Base

  belongs_to :submission

  def file=(_file)
    write_attribute :content_type, _file.content_type
    write_attribute :original_filename, _file.original_filename
  end
end
