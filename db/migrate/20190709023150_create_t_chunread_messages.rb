class CreateTChunreadMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :t_chunread_messages do |t|
      t.integer :chmsg_id
      t.integer :chuser_id
      t.boolean :is_read

      t.timestamps
    end
  end
end
