module Features

  module SubmissionHelpers

    def given_i_am_applying_for_a_job
      given_jobs_are_present

      visit new_submission_path(job_id: Job.first.id)
    end

    def and_i_have_filled_out_the_submission_form
      fill_in 'Name', with: 'Greg'
      fill_in 'Email', with: 'greg.oleksiak@gmail.com'
      fill_in 'Phone number', with: '(843) 513-7341'
    end

    def when_i_submit_the_submission_form
      click_button 'Submit'
    end

    def when_i_submit_the_submission_form_without_my_name
      fill_in 'Email', with: 'greg.oleksiak@gmail.com'
      fill_in 'Phone number', with: '(843) 513-7341'
      when_i_submit_the_submission_form
    end

    def then_i_should_be_required_to_provide_my_name
      expect(page).to have_css('.alert', text: "Name can't be blank")
    end

    def then_i_should_see_a_notification_of_success
      expect(page).to have_css('.alert', text: 'Application successfully submitted')
    end
  end
end

RSpec.configure do |config|
  config.include Features::SubmissionHelpers, type: :feature
end
