module Features

  module JobHelpers

    def given_jobs_exist
      create_list :job, 3
    end

    def then_i_should_see_a_list_of_jobs
      expect(page).to have_css('ul.jobs li', count: 3)
    end
  end
end

RSpec.configure do |config|
  config.include Features::JobHelpers, type: :feature
end
