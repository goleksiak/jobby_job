require 'rails_helper'

RSpec.feature 'Admin updates Job' do

  scenario 'and sees a notification of success' do
    given_i_am_signed_in_as_an_admin
    and_jobs_are_present
    when_i_update_a_job
    then_i_should_see_a_notification_of_successful_job_update
  end
end
