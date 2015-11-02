require 'rails_helper'

RSpec.describe Job, type: :model do

  it { is_expected.to have_many(:submissions) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:description) }
end
