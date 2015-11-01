require 'rails_helper'

RSpec.describe Submission, type: :model do

  it { is_expected.to have_one(:resume) }
  it { is_expected.to have_one(:cover_letter) }

  it { is_expected.to belong_to(:job) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:phone_number) }

  it { is_expected.to accept_nested_attributes_for(:cover_letter) }
  it { is_expected.to accept_nested_attributes_for(:resume) }
end
