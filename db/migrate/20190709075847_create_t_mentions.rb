class CreateTMentions < ActiveRecord::Migration[5.2]
  def change
    create_table :t_mentions do |t|
      t.integer :login_user_id
      t.integer :chmsgmen_id
      t.string :mention_message

      t.timestamps
    end
  end
end
