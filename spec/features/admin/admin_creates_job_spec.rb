require 'rails_helper'

RSpec.feature 'Admin creates Job' do

  scenario 'and is required to provide Job title' do
    given_i_am_signed_in_as_an_admin
    when_i_create_a_job_without_a_title
    then_i_should_be_required_to_provide_the_job_title
  end

  scenario 'and is required to provide Job description' do
    given_i_am_signed_in_as_an_admin
    when_i_create_a_job_without_a_description
    then_i_should_be_required_to_provide_the_job_description
  end

  scenario 'and sees a notification of successful Job creation' do
    given_i_am_signed_in_as_an_admin
    when_i_create_a_job
    then_i_should_see_a_notification_of_successful_job_creation
  end
end
