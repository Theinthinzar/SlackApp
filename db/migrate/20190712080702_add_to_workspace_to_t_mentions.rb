class AddToWorkspaceToTMentions < ActiveRecord::Migration[5.2]
  def change
    add_column :t_mentions, :workspace_id, :integer
  end
end
