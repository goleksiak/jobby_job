require 'rails_helper'

RSpec.feature 'Admin creates Job' do

  scenario 'and is required to provide Job title' do
    given_i_am_signed_in_as_an_admin
    when_i_create_a_job_without_a_title
    then_i_should_be_required_to_provide_the_job_title
  end

  scenario 'Admin required to provide Job description' do
    given_i_am_signed_in_as_an_admin
    when_i_create_a_job_without_a_description
    then_i_should_be_required_to_provide_the_job_description
  end

  scenario 'Admin required to provide Job location' do
    # as_an_admin
    # who_is_creating_a_job
    # i_should_be_required_to_provide_the_job_location
  end

  scenario 'Admin successfully creates Job' do
    # as_an_admin
    # who_has_successfully_created_a_job
    # i_should_see_a_notification_of_success
  end
end
