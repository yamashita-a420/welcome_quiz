class RenameChallengersToGuests < ActiveRecord::Migration[6.1]
  def change
    rename_table :challengers, :guests
  end
end
