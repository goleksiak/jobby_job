require 'rails_helper'

RSpec.feature 'User views Jobs' do

  scenario 'User views a list of Jobs' do
    given_jobs_exist
    when_i_visit_the_jobs_page
    then_i_should_see_a_list_of_jobs
  end
end
