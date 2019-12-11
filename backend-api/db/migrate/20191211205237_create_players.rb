class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :highscore, default: 0

      t.timestamps
    end
  end
end
