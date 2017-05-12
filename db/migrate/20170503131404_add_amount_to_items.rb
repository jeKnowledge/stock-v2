class AddAmountToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :amount, :integer
    change_column :items, :state, :boolean, :default => false
  end
end
