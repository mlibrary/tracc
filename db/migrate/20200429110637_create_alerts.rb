class CreateAlerts < ActiveRecord::Migration[5.2]
  def change
    create_table :alerts do |t|
      t.integer :card_id
      t.integer :track_id
      t.string :uniqname1
      t.string :uniqname2
      t.string :uniqname3
      t.string :uniqname4
      t.string :owner
      t.string :type
      t.string :cycle
      t.integer :status
      t.string :created_date
      t.timestamps
    end
  end
end
