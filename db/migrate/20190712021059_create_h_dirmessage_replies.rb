class CreateHDirmessageReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :h_dirmessage_replies do |t|
      t.integer :reply_user_id
      t.integer :dirmsg_id
      t.string :dirthread_msg
      t.boolean :is_read

      t.timestamps
    end
  end
end
