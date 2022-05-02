class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :photo
      t.string :content, null: false
      t.string :comment
      t.integer :level, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
