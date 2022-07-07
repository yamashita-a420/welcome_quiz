class ChangeMessagesIdTypeToUuid < ActiveRecord::Migration[6.1]
  def up
    # messagesテーブルにuuid追加
    add_column :messages, :uuid, :uuid, null: false, default: 'gen_random_uuid()'

    # messagesのidを消して、追加したuuidのカラム名をidに変更
    change_table :messages do |t|
      t.remove :id
      t.rename :uuid, :id
  end

    # messagesのuuid化したidをprimary keyとして設定
    execute 'ALTER TABLE messages ADD PRIMARY KEY (id);'

  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
