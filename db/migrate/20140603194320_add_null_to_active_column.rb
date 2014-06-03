class AddNullToActiveColumn < ActiveRecord::Migration
  def change
    change_column_null :stories, :active, false
  end
end
