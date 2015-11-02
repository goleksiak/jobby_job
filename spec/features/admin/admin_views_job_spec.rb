require 'rails_helper'

RSpec.feature 'Admin views Job' do

  scenario 'and has the ability edit the Jobs' do
    given_i_am_signed_in_as_an_admin
    and_jobs_are_present
    when_i_view_the_jobs_list
    then_i_should_be_able_to_edit_the_jobs
  end
end
