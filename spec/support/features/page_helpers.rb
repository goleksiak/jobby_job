module Features

  module PageHelpers

    def when_i_visit_the_jobs_page
      visit root_path
    end
  end
end

RSpec.configure do |config|
  config.include Features::PageHelpers, type: :feature
end
