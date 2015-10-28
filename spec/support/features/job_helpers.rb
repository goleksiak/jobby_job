module Features

  module JobHelpers

    def given_jobs_are_present(count = 3)
      create_list :job, count
    end

    def when_i_visit_the_jobs_page
      visit jobs_path
    end

    def and_i_click_on_a_job
      first('li.job a').click
    end

    def then_i_should_see_a_list_of_jobs
      expect(page).to have_css('ul.jobs li', count: 3)
    end

    def then_i_should_see_the_job_description
      expect(page).to have_content('Job description')
    end

    def then_i_should_see_the_job_title
      expect(page).to have_content('Job Title')
    end

    def then_i_should_see_the_job_details
      then_i_should_see_the_job_description
      then_i_should_see_the_job_title
    end
  end
end

RSpec.configure do |config|
  config.include Features::JobHelpers, type: :feature
end
