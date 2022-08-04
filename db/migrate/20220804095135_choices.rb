class Choices < ActiveRecord::Migration[6.1]
  def change
    remove_column :choices, :user_id, :uuid
  end
end
