class AddColumnToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :role, :integer, default: 0, null: false
  end
end
