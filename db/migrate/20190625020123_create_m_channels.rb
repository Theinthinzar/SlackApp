class CreateMChannels < ActiveRecord::Migration[5.2]
  def change
    create_table :m_channels do |t|
      t.string  :channel_name
      t.integer :user_id
      t.integer :workspace_id
      t.boolean :status

      t.timestamps
    end
  end
end
