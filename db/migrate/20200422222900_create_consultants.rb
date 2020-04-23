class CreateConsultants < ActiveRecord::Migration[5.2]
  def change
    create_table :consultants do |t|
 	  t.integer :card_id
      t.string :uniqname
      t.string :type
      t.string :role
      t.string :trackname
      t.string :cycle
      t.timestamps
    end
  end
end
