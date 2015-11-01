module Features

  module UserHelpers

    def given_i_am_a_visitor
    end

    def then_i_should_be_required_to_authenticate
      expect(page).to have_content('Sign in')
    end

    def given_i_am_signed_in_as_an_admin
      admin = create :user_admin

      sign_in_with admin.email, 'password'
    end

    def sign_in_with(email, password)
      visit sign_in_path
      fill_in 'session_email', with: email
      fill_in 'session_password', with: password
      click_button 'Sign in'
    end
  end
end

RSpec.configure do |config|
  config.include Features::UserHelpers, type: :feature
end
