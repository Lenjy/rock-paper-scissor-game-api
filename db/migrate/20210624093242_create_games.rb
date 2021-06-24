class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :name
      t.string :move
      t.string :move_bot
      t.string :result

      t.timestamps
    end
  end
end
