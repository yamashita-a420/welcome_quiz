class CreateQuizTops < ActiveRecord::Migration[6.1]
  def change
    create_table :quiz_tops, id: :uuid do |t|
      t.string :photo
      t.references :quiz, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
