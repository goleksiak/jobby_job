require 'rails_helper'

RSpec.feature 'User Creates Submission' do

  scenario 'and is required to provide their name' do
    given_i_am_applying_for_a_job
    when_i_submit_the_submission_form_without_my_name
    then_i_should_be_required_to_provide_my_name
  end

  scenario 'and is required to provide their email' do
    given_i_am_applying_for_a_job
    when_i_submit_the_submission_form_without_my_email
    then_i_should_be_required_to_provide_my_email
  end

  scenario 'and is required to provide their phone number' do
    given_i_am_applying_for_a_job
    when_i_submit_the_submission_form_without_my_phone_number
    then_i_should_be_required_to_provide_my_phone_number
  end

  scenario 'and is notified of successful submission' do
    given_i_am_applying_for_a_job
    and_i_have_filled_out_the_submission_form
    when_i_submit_the_submission_form
    then_i_should_see_a_notification_of_success
  end

  scenario 'and uploads cover page and resume' do
    given_i_am_applying_for_a_job
    and_i_have_filled_out_the_submission_form
    and_i_have_uploaded_a_cover_letter
    and_i_have_uploaded_a_resume
    when_i_submit_the_submission_form
    then_i_should_see_a_notification_of_success
  end
end
