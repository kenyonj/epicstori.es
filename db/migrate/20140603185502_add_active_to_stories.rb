class AddActiveToStories < ActiveRecord::Migration
  def change
    add_column :stories, :active, :boolean, default: false
  end
end
