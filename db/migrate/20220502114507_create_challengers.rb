class CreateChallengers < ActiveRecord::Migration[6.1]
  def change
    create_table :challengers do |t|
      t.string :name, null: false
      t.string :message, null: false, default: 'クイズ楽しかったよ！'

      t.timestamps
    end
  end
end
