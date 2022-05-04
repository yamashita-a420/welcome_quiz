class AddForeignKeyToChoices < ActiveRecord::Migration[6.1]
  def change
    add_reference :choices, :user, null: false, foreign_key: true
  end
end
