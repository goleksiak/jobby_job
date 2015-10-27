require 'rails_helper'

RSpec.feature 'Admin creates Job' do

  scenario 'Admin required to provide Job name' do
    # as_an_admin
    # who_is_creating_a_job
    # i_should_be_required_to_provide_the_job_name
  end

  scenario 'Admin required to provide Job description' do
    # as_an_admin
    # who_is_creating_a_job
    # i_should_be_required_to_provide_the_job_description
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
