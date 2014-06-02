require 'spec_helper'

feature 'User signs in' do
  scenario 'with email address and correct password' do
    create(:user, username: 'justin', email: 'test@test.com', password_digest: 'password')
    visit root_path

    within '#new_session' do
      fill_in 'Email or username', with: 'test@test.com'
      fill_in 'Password', with: 'password'
    end
    click_button 'Sign in'

    expect(page).to have_content "Welcome justin"
    expect(page).to have_content "Sign Out"
  end

  scenario 'with email address and incorrect password' do
    visit root_path

    within '#new_session' do
      fill_in 'Email or username', with: 'foo@bar.com'
      fill_in 'Password', with: '12345'
    end

    click_button 'Sign in'
    expect(page).to have_content "Email"
    expect(page).to have_content "Password"
  end
end
