class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.integer :card_id
      t.integer :chips
      t.string :uniqname
      t.string :type
      t.string :role
      t.string :trackname
      t.timestamps
    end
  end
end
