class CreateChipAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :chip_assignments do |t|
      t.integer :card_id
      t.integer :chips
      t.string :uniqname
      t.string :type
      t.string :role
      t.string :trackname
      t.string :month
      t.string :cycle
      t.timestamps
    end
  end
end
