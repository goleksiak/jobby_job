module Features

  module PageHelpers

    def when_i_visit_a_secure_resource
      visit new_admin_job_path
    end

    def when_i_visit_the_jobs_page
      visit jobs_path
    end
  end
end

RSpec.configure do |config|
  config.include Features::PageHelpers, type: :feature
end
