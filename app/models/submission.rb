class Submission < ActiveRecord::Base

  belongs_to :job

  validates :name,
            :email,
            :phone_number,
            presence: true
end
