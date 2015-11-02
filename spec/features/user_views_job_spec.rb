require 'rails_helper'

RSpec.feature 'User views Job' do

  scenario 'and applies for the Job' do
    given_a_job_is_present
    when_i_apply_for_the_job
    then_i_should_see_the_submission_form
  end
end
