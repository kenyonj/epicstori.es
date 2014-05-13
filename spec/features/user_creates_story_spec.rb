require 'spec_helper'

feature 'User creates story' do
  scenario 'with valid information' do
    create_user_and_sign_in
    visit new_story_path

    title = 'ABC'
    create_story(title)

    expect(page).to have_content "Story title: #{title}"
  end

  scenario 'with invalid information' do
    create_user_and_sign_in
    visit new_story_path

    create_story

    expect(page).to have_content "Title can't be blank"
  end

  def create_user_and_sign_in
    user = create(:user)
    sign_in(user)
  end

  def create_story(title='')
    within '#new_story' do
      fill_in 'Story Title', with: title
    end

    click_button 'Start Story'
  end
end
