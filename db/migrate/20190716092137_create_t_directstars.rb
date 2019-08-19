class CreateTDirectstars < ActiveRecord::Migration[5.2]
  def change
    create_table :t_directstars do |t|
      t.integer :star_userid
      t.integer :stardimsg_id

      t.timestamps
    end
  end
end
