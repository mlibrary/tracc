class CreateCycleReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :cycle_reviews do |t|
      t.belongs_to :card, index: true
      t.integer :card_id	
      t.string :status
      t.string :rationale
      t.string :cycle
      t.string :notes 
      t.string :type 
      t.timestamps
    end
  end
end
