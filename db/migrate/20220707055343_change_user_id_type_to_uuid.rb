class ChangeUserIdTypeToUuid < ActiveRecord::Migration[6.1]
  def up
    # usersテーブルにuuid追加
    add_column :users, :uuid, :uuid, null: false, default: 'gen_random_uuid()'

    # 関連テーブルにuuid追加
    add_column :choices, :user_uuid, :uuid
    add_column :messages, :user_uuid, :uuid
    add_column :questions, :user_uuid, :uuid

    # 関連テーブルのuuidを更新(これでusersのuuidとchoicesのuser_uuidが紐づく)
    execute <<~SQL
      UPDATE choices SET user_uuid = users.uuid
      FROM users WHERE choices.user_id = users.id;
    SQL

    execute <<~SQL
      UPDATE messages SET user_uuid = users.uuid
      FROM users WHERE messages.user_id = users.id;
    SQL

    execute <<~SQL
      UPDATE questions SET user_uuid = users.uuid
      FROM users WHERE questions.user_id = users.id;
    SQL

    # usersの元々のprimary keyであるidを消す
    # 外部キーとして参照されていると消せないので、関連テーブルからの参照を切る
    remove_foreign_key :choices, :users
    remove_reference :choices, :user, index: true

    remove_foreign_key :messages, :users
    remove_reference :messages, :user, index: true

    remove_foreign_key :questions, :users
    remove_reference :questions, :user, index: true

    # usersのidを消して、追加したuuidのカラム名をidに変更
    change_table :users do |t|
      t.remove :id
      t.rename :uuid, :id
    end

    # usersのuuid化したidをprimary keyとして設定
    execute 'ALTER TABLE users ADD PRIMARY KEY (id);'

    # 関連テーブルに追加したuuidを元々あった名前に変更(元々あったuser_idはusersテーブルのidを消した時に消えてるはずなので競合しない)
    rename_column :choices, :user_uuid, :user_id
    rename_column :messages, :user_uuid, :user_id
    rename_column :questions, :user_uuid, :user_id

    # 関連テーブルのuuid化したuser_idを外部キーとして設定
    add_foreign_key :choices, :users
    add_index :choices, :user_id
    change_column_null :choices, :user_id, false

    add_foreign_key :messages, :users
    add_index :messages, :user_id
    change_column_null :messages, :user_id, false

    add_foreign_key :questions, :users
    add_index :questions, :user_id
    change_column_null :questions, :user_id, false
  end

  def down
    # idに戻すことは無いと思うのでroleback不可を明示的にする
    raise ActiveRecord::IrreversibleMigration
  end
end
