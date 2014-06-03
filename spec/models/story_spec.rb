require "spec_helper"

describe Story do
  it "is valid when created with a title and active value" do
    story = Story.new(user: user, title: "This is a title", active: true)

    expect(story).to be_valid
  end

  it "is invalid when created without a title" do
    story = Story.new(user: user, title: nil, active: true)

    expect(story).not_to be_valid
  end

  it "returns all active stories when .active is called" do
    create_stories

    active_stories = Story.active

    expect(active_stories.count).to be 2
  end

  it "returns all inactive stories when .inactive is called" do
    create_stories

    inactive_stories = Story.inactive

    expect(inactive_stories.count).to be 1
  end

  def user
    create(:user)
  end

  def create_stories
    create(:story, user: user, active: true, title: "This is story 1")
    create(:story, user: user, active: true, title: "This is story 2")
    create(:story, user: user, title: "This is story 3")
  end
end
