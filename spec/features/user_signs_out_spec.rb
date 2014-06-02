require "spec_helper"

feature "User signs out" do
  scenario "successfully" do
    create_user
    visit root_path
    login_with(login: "test@test.com", password: "password")

    click_button "Sign out"

    expect(page).to have_field("Email or username")
    expect(page).to_not have_content "Sign out"
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
