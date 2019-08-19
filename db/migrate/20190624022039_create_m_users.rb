class CreateMUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :m_users do |t|
      t.string :user_name
      t.string :user_email

      t.timestamps
    end
  end
end
