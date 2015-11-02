class Job < ActiveRecord::Base

  has_many :submissions

  validates :title,
            :description,
            presence: true
end
