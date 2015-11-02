require 'rails_helper'

RSpec.feature 'Admin views Submission' do

  scenario 'and sees Submission information' do
    given_i_am_signed_in_as_an_admin
    and_submissions_are_present
    when_i_view_a_submission
    then_i_should_see_submission_information
  end
end
