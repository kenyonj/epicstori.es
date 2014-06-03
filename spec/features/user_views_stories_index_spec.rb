require "spec_helper"

feature "User views stories index" do
  scenario "and sees only the active stories in a ul" do
    user = create(:user)
    story_1 = create(
      :story,
      user: user,
      title: "Story Title 1",
      active: true
    )
    story_2 = create(
      :story,
      user: user,
      title: "Story Title 2"
    )

    visit stories_path

    expect(page).to have_css "li.active", text: story_1.title
    expect(page).not_to have_css "li.active", text: story_2.title
  end
end
