require 'rails_helper'

RSpec.feature 'User views Job' do

  scenario 'by clicking on a Job in the Jobs list' do
    given_jobs_are_present
    when_i_visit_the_jobs_page
    and_i_click_on_a_job
    then_i_should_see_the_job_details
  end

  scenario 'and applies for the Job' do
    given_i_am_viewing_a_job
    when_i_apply_for_the_job
    then_i_should_see_the_submission_form
  end
end
