module Features

  module JobHelpers

    def given_jobs_are_present(count = 3)
      create_list :job, count
    end

    def given_i_am_viewing_a_job
      given_jobs_are_present
      when_i_visit_the_jobs_page
      and_i_click_on_a_job
    end

    def when_i_update_a_job
      visit edit_admin_job_path(Job.first)
      fill_in 'Title', with: 'New Job title'
      fill_in 'Description', with: 'New Job description'
      click_button 'Save'
    end

    def when_i_create_a_job_without_a_description
      visit new_admin_job_path
      fill_in 'Title', with: 'New Job title'
      click_button 'Save'
    end

    def when_i_create_a_job_without_a_title
      visit new_admin_job_path
      fill_in 'Description', with: 'New Job description'
      click_button 'Save'
    end

    def when_i_create_a_job
      visit new_admin_job_path
      fill_in 'Title', with: 'New Job title'
      fill_in 'Description', with: 'New Job description'
      click_button 'Save'
    end

    def when_i_apply_for_the_job
      click_link 'Apply'
    end

    def and_i_click_on_a_job
      first('li.job a').click
    end

    def then_i_should_see_a_notification_of_successful_job_update
      expect(page).to have_css('.alert', text: 'Job successfully updated')
    end

    def then_i_should_see_a_notification_of_successful_job_creation
      expect(page).to have_css('.alert', text: 'Job successfully created')
    end

    def then_i_should_be_required_to_provide_the_job_description
      expect(page).to have_css('.alert', text: "Description can't be blank")
    end

    def then_i_should_be_required_to_provide_the_job_title
      expect(page).to have_css('.alert', text: "Title can't be blank")
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

    def then_i_should_be_able_to_edit_the_jobs
      expect(page).to have_css('.job a', text: 'Edit')
    end

    alias :and_jobs_are_present :given_jobs_are_present
    alias :when_i_view_a_job :given_i_am_viewing_a_job
    alias :then_i_should_be_able_to_edit_the_job :then_i_should_be_able_to_edit_the_jobs
  end
end

RSpec.configure do |config|
  config.include Features::JobHelpers, type: :feature
end
