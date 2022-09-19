class CreateQuizTops < ActiveRecord::Migration[6.1]
  def change
    create_table :quiz_tops, id: :uuid do |t|
      t.string :title, null: false, default: "Welcome Quiz"
      t.string :explain, null: false, default: "ようこそ！　ささやかですが　クイズをご用意しました　お楽しみ頂けますと幸いです"
      t.string :photo
      t.references :user, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
