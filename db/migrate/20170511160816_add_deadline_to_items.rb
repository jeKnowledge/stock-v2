class AddDeadlineToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :deadline, :datetime
  end
end
