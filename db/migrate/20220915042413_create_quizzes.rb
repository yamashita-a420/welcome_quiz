class CreateQuizzes < ActiveRecord::Migration[6.1]
  def change
    create_table :quizzes, id: :uuid do |t|
      t.string :title, null: false, default: "Welcome Quiz"
      t.string :explain, null: false, default: "ようこそ！<br>ささやかですが<br>クイズをご用意しました<br>お楽しみ頂けますと幸いです"
      t.references :user, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
