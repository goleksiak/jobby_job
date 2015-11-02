require 'rails_helper'

RSpec.feature 'Admin views Submission' do

  scenario 'and sees Submission information' do
    given_i_am_signed_in_as_an_admin
    and_submissions_are_present
    when_i_view_a_submission
    then_i_should_see_submission_information
  end

  scenario 'and views uploaded Documents' do
    given_i_am_signed_in_as_an_admin
    and_a_submission_with_documents_is_present
    when_i_view_a_submission
    then_i_should_be_able_to_view_uploaded_documents
  end
end
