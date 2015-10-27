require 'rails_helper'

RSpec.feature 'User Creates Application' do

  scenario 'User required to provide their name' do
    # as_a_visitor
    # who_is_viewing_the_application_form
    # i_should_be_required_to_provide_my_name
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

  scenario 'User successfully creates Application' do
    # as_a_visitor
    # who_has_successfully_applied_for_a_job
    # i_should_see_a_notification_of_success
  end
end
