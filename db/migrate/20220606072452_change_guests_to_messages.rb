class ChangeGuestsToMessages < ActiveRecord::Migration[6.1]
  def change
    rename_table :guests, :messages
  end
end
