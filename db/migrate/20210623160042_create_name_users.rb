class CreateNameUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :name_users do |t|
      t.string :move_user
      t.string :move_bot
      t.string :result

      t.timestamps
    end
  end
end
