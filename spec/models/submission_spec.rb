require 'rails_helper'

RSpec.describe Submission, type: :model do

  it { is_expected.to belong_to(:job) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:phone_number) }
end
