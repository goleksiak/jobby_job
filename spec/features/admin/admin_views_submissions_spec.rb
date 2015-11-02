require 'rails_helper'

RSpec.feature 'Admin views Submissions' do

  scenario 'and sees that Submissions are present' do
    given_i_am_signed_in_as_an_admin
    and_a_job_with_submissions_is_present
    when_i_view_the_job_submissions
    then_i_should_see_submissions
  end
end
