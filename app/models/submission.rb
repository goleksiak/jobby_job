class Submission < ActiveRecord::Base

  with_options class_name: 'Document' do |association|
    association.has_one :cover_letter
    association.has_one :resume
  end

  belongs_to :job, counter_cache: true

  validates :name,
            :email,
            :phone_number,
            presence: true

  accepts_nested_attributes_for :cover_letter,
                                :resume,
                                reject_if: proc { |attributes| attributes['file'].blank? }
end
