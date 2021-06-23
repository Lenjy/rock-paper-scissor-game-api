class CreateMoves < ActiveRecord::Migration[6.1]
  def change
    create_table :moves do |t|
      t.string :name
      t.string :move
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
