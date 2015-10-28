require 'rails_helper'

RSpec.feature 'User views Jobs' do

  scenario 'on the Jobs page' do
    given_jobs_are_present
    when_i_visit_the_jobs_page
    then_i_should_see_a_list_of_jobs
  end
end
