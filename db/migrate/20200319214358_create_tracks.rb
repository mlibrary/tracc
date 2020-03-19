class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.integer :card_id
      t.string :epic_title
      t.string :track
      t.integer :status
      t.timestamps
    end
  end
end
