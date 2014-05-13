class StoriesController < ApplicationController
  respond_to :html

  def new
    @story = Story.new
  end

  def create
    @story = current_user.stories.create(story_params)
    respond_with @story
  end

  def show
    @story = find_story
  end

  private

  def story_params
    params.require(:story).permit(:title)
  end

  def find_story
    Story.find(params[:id])
  end
end
