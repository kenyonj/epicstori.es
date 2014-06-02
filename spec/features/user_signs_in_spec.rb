require "spec_helper"

feature "User signs in" do
  scenario "with email address and correct password" do
    create_user
    visit root_path

    login_with(login: "test@test.com", password: "password")

    expect(page).to have_content "Welcome justin"
    expect(page).to have_content "Sign Out"
  end

  scenario "with email address and incorrect password" do
    create_user
    visit root_path

    login_with(login: "foo@bar.com", password: "12345")

    expect(page).to have_content "Email"
    expect(page).to have_content "Password"
  end

  scenario "with username and correct password" do
    create_user
    visit root_path

    login_with(login: "justin", password: "password")

    expect(page).to have_content "Welcome justin"
    expect(page).to have_content "Sign Out"
  end

  scenario "with username and incorrect password" do
    create_user
    visit root_path

    login_with(login: "justin", password: "12345")

    expect(page).to have_content "Email"
    expect(page).to have_content "Password"
  end

  def create_user
    create(
      :user,
      username: "justin",
      email: "test@test.com",
      password_digest: "password"
    )
  end

  def login_with(options = {})
    within "#new_session" do
      fill_in "Email or username", with: options[:login]
      fill_in "Password", with: options[:password]
    end
    click_button "Sign in"
  end
end
