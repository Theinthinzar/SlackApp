class CreateTChmsgstars < ActiveRecord::Migration[5.2]
  def change
    create_table :t_chmsgstars do |t|
      t.integer :chstar_userid
      t.integer :chmsgstarid

      t.timestamps
    end
  end
end
