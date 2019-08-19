class CreateHChmessageReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :h_chmessage_replies do |t|
      t.integer :chmsgid
      t.integer :chreplyer_id
      t.string :chthreadmsg

      t.timestamps
    end
  end
end
