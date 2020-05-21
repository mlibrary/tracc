class CreatePlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :plogs do |t|
      t.integer :logtype 
      t.string :log_details
      t.string :uniqname
      t.string :note
     
      t.timestamps
    end
  end
end
