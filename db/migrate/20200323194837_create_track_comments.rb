class CreateTrackComments < ActiveRecord::Migration[5.2]
  def change
    create_table :track_comments do |t|
      t.integer :card_id
      t.string :epic_title
      t.string :comment1
      t.string :comment2
      t.string :comment3
      t.string :comment4
      t.string :cycle
      t.string :uemail	
      t.timestamps
    end
  end
end
