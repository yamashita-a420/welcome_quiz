class ChangeQuestionsIdTypeToUuid < ActiveRecord::Migration[6.1]
  def up
    # questionsテーブルにuuid追加
    add_column :questions, :uuid, :uuid, null: false, default: 'gen_random_uuid()'

    # 関連テーブルにuuid追加
    add_column :choices, :question_uuid, :uuid

    # 関連テーブルのuuidを更新(これでquestionsのuuidとchoicesのquestion_uuidが紐づく)
    execute <<~SQL
      UPDATE choices SET question_uuid = questions.uuid
      FROM questions WHERE choices.question_id = questions.id;
    SQL

    # questionsの元々のprimary keyであるidを消す
    # 外部キーとして参照されていると消せないので、関連テーブルからの参照を切る
    remove_foreign_key :choices, :questions
    remove_reference :choices, :question, index: true

    # questionsのidを消して、追加したuuidのカラム名をidに変更
    change_table :questions do |t|
      t.remove :id
      t.rename :uuid, :id
    end

    # questionsのuuid化したidをprimary keyとして設定
    execute 'ALTER TABLE questions ADD PRIMARY KEY (id);'

    # 関連テーブルに追加したuuidを元々あった名前に変更(元々あったquestion_idはquestionsテーブルのidを消した時に消えてるはずなので競合しない)
    rename_column :choices, :question_uuid, :question_id

    # 関連テーブルのuuid化したquestion_idを外部キーとして設定
    add_foreign_key :choices, :questions
    add_index :choices, :question_id
    change_column_null :choices, :question_id, false
  end

  def down
    # idに戻すことは無いと思うのでroleback不可を明示的にする
    raise ActiveRecord::IrreversibleMigration
  end
end
