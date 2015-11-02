module Features

  module SubmissionHelpers

    def given_i_am_applying_for_a_job
      given_jobs_are_present

      visit new_submission_path(job_id: Job.first.id)
    end

    def and_submissions_are_present
      create_list :submission_with_job, 3
    end

    def and_i_have_filled_out_the_submission_form
      fill_in 'Name', with: 'Greg'
      fill_in 'Email', with: 'greg.oleksiak@gmail.com'
      fill_in 'Phone number', with: '(843) 513-7341'
    end

    def when_i_view_a_submission
      visit admin_submission_path(Submission.first)
    end

    def when_i_submit_the_submission_form
      click_button 'Submit'
    end

    def when_i_submit_the_submission_form_without_my_phone_number
      fill_in 'Name', with: 'Greg'
      fill_in 'Email', with: 'greg.oleksiak@gmail.com'
      when_i_submit_the_submission_form
    end

    def when_i_submit_the_submission_form_without_my_email
      fill_in 'Name', with: 'Greg'
      fill_in 'Phone number', with: '(843) 513-7341'
      when_i_submit_the_submission_form
    end

    def when_i_submit_the_submission_form_without_my_name
      fill_in 'Email', with: 'greg.oleksiak@gmail.com'
      fill_in 'Phone number', with: '(843) 513-7341'
      when_i_submit_the_submission_form
    end

    def and_a_submission_with_documents_is_present
      create :submission_with_job_and_documents
    end

    def and_i_have_uploaded_a_cover_letter
      attach_file 'submission_cover_letter_attributes_file', File.join(Rails.root, 'spec/fixtures', 'cover_letter.txt')
    end

    def and_i_have_uploaded_a_resume
      attach_file 'submission_resume_attributes_file', File.join(Rails.root, 'spec/fixtures', 'resume.txt')
    end

    def then_i_should_be_required_to_provide_my_phone_number
      expect(page).to have_css('.alert', text: "Phone number can't be blank")
    end

    def then_i_should_be_required_to_provide_my_email
      expect(page).to have_css('.alert', text: "Email can't be blank")
    end

    def then_i_should_be_required_to_provide_my_name
      expect(page).to have_css('.alert', text: "Name can't be blank")
    end

    def then_i_should_see_a_notification_of_success
      expect(page).to have_css('.alert', text: 'Application successfully submitted')
    end

    def then_i_should_see_the_submission_form
      expect(page).to have_css('form#new_submission')
    end

    def then_i_should_be_able_to_view_submissions
      expect(page).to have_css('a.submission')
    end

    def then_i_should_see_submission_information
      build(:submission).attributes.each do |key, value|
        expect(page).to have_content(value)
      end
    end

    def then_i_should_be_able_to_view_uploaded_documents
      expect(page).to have_link('Cover letter', href: %r{s3.amazonaws.com})
      expect(page).to have_link('Resume', href: %r{s3.amazonaws.com})
    end
  end
end

RSpec.configure do |config|
  config.include Features::SubmissionHelpers, type: :feature
end
