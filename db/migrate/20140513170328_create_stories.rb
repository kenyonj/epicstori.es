class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.belongs_to :user, index: true
      t.string :title, null: false

      t.timestamps
    end
  end
end
