require 'rails_helper'

RSpec.feature 'User views Job' do

  scenario 'by clicking on a Job in the Jobs list' do
    given_jobs_are_present
    when_i_visit_the_jobs_page
    and_i_click_on_a_job
    then_i_should_see_the_job_details
  end
end
