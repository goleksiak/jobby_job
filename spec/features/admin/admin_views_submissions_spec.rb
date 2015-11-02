require 'rails_helper'

RSpec.feature 'Admin views Submissions' do

  scenario 'and sees that Submissions are present' do
    given_i_am_signed_in_as_an_admin
    and_submissions_are_present
    when_i_visit_the_jobs_page
    then_i_should_be_able_to_view_submissions
  end
end
