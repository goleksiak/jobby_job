require 'rails_helper'

RSpec.feature 'Secure resources' do

  scenario 'should require authentication' do
    given_i_am_a_visitor
    when_i_visit_a_secure_resource
    then_i_should_be_required_to_authenticate
  end
end
