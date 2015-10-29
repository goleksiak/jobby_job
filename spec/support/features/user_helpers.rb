module Features

  module UserHelpers

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

    def sign_out
      click_button I18n.t('layouts.application.sign_out')
    end

    def expect_user_to_be_signed_in
      visit root_path
      expect(page).to have_button I18n.t('layouts.application.sign_out')
    end

    def expect_user_to_be_signed_out
      expect(page).to have_content I18n.t('layouts.application.sign_in')
    end
  end
end

RSpec.configure do |config|
  config.include Features::UserHelpers, type: :feature
end
