class AddTwitterShareToQuizTops < ActiveRecord::Migration[6.1]
  def change
    add_column :quiz_tops, :twitter_share, :boolean, default: false, null:false
  end
end
