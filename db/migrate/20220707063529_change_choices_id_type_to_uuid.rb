class ChangeChoicesIdTypeToUuid < ActiveRecord::Migration[6.1]
  def up
    # choicesテーブルにuuid追加
    add_column :choices, :uuid, :uuid, null: false, default: 'gen_random_uuid()'

    # choicesのidを消して、追加したuuidのカラム名をidに変更
    change_table :choices do |t|
      t.remove :id
      t.rename :uuid, :id
  end

    # choicesのuuid化したidをprimary keyとして設定
    execute 'ALTER TABLE choices ADD PRIMARY KEY (id);'

  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
