require 'spec_helper'

feature 'User signs up' do
  scenario 'with valid information' do
    username = 'Tester'

    sign_up_via_form(username)

    expect(page).to have_content "Welcome #{username}"
    expect(page).to have_content "Sign Out"
  end

  scenario 'with invalid information and sees errors' do
    sign_up_via_form

    expect(page).to have_css "#new_user"
    expect(page).to have_content "Username can't be blank"
  end

  def sign_up_via_form(username='')
    visit root_path
    within '#new_user' do
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Username', with: username
      fill_in 'Password', with: 'password'
      fill_in 'First Name', with: 'Test'
      fill_in 'Last Name', with: 'Testing'
    end
    click_button 'Sign up'
  end
end
