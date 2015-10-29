require 'rails_helper'

RSpec.feature 'User Creates Submission' do

  scenario 'and is required to provide their name' do
    given_i_am_applying_for_a_job
    when_i_submit_the_submission_form_without_my_name
    then_i_should_be_required_to_provide_my_name
  end

  scenario 'User required to provide their email' do
    # as_a_visitor
    # who_is_viewing_the_application_form
    # i_should_be_required_to_provide_my_email
  end

  scenario 'User required to provide their phone number' do
    # as_a_visitor
    # who_is_viewing_the_application_form
    # i_should_be_required_to_provide_my_phone_number
  end

  scenario 'and is notified of successful submission' do
    given_i_am_applying_for_a_job
    and_i_have_filled_out_the_submission_form
    when_i_submit_the_submission_form
    then_i_should_see_a_notification_of_success
  end
end
