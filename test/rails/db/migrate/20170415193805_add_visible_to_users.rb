class AddVisibleToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :visible, :integer, default: 1
  end
end
