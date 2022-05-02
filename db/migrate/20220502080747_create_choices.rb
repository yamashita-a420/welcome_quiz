class CreateChoices < ActiveRecord::Migration[6.1]
  def change
    create_table :choices do |t|
      t.string :content, null: false
      t.integer :correct_answer, null: false, default: 0
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
