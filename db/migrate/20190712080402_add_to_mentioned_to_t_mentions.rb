class AddToMentionedToTMentions < ActiveRecord::Migration[5.2]
  def change
    add_column :t_mentions, :mentioned_id, :integer
  end
end
