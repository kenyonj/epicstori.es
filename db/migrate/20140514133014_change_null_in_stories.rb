class ChangeNullInStories < ActiveRecord::Migration
  def change
    change_column_null :stories, :user_id, false
  end
end
