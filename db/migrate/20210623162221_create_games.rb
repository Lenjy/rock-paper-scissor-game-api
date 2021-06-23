class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :name_user
      t.string :move_user
      t.string :move_bot
      t.string :result

      t.timestamps
    end
  end
end
